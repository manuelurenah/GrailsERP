package grailserp

import grailserp.reports.ArticlePurchase
import net.sf.jasperreports.engine.JRExporter
import net.sf.jasperreports.engine.JRExporterParameter
import net.sf.jasperreports.engine.JasperCompileManager
import net.sf.jasperreports.engine.JasperFillManager
import net.sf.jasperreports.engine.JasperPrint
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource
import net.sf.jasperreports.engine.export.JRPdfExporter
import org.apache.commons.beanutils.converters.BigDecimalConverter
import org.apache.commons.io.output.ByteArrayOutputStream
import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*

class PurchaseController {

    def springSecurityService

    def index() {
        def user = User.get(springSecurityService.currentUser.id)
        [user: user]
    }

    private generate_dispatch_report(Purchase purchase) {
        println "------------ STARTING REPORT ----------------"
        ByteArrayOutputStream pdfStream = null
        try {
            println "------------------ REPORT IS BEING GENERATED --------------------"
            String reportName, jrxmlFileName, dotJasperFileName
            jrxmlFileName = "Dispatch"
            reportName = grailsApplication.mainContext.getResource("reports/${jrxmlFileName}.jrxml").file.getAbsoluteFile()
            dotJasperFileName = grailsApplication.mainContext.getResource("reports/${jrxmlFileName}.jasper").file.getAbsoluteFile()
            println reportName
            // Report parameter

            Map<String, Object> reportParam = new HashMap<String, Object>()
            def listItems = ArticlePurchase.getArticlesFromPurchase(purchase)
            println purchase
            def dataSource = new JRBeanCollectionDataSource(listItems)

            reportParam.put("customerName", purchase.user.name + " " + purchase.user.lastname)
            reportParam.put("customerEmail", purchase.user.email)
            reportParam.put("dispatchNumber", "DIS000" + purchase.id as String)
            reportParam.put("invoiceTotal",'$' + purchase.total as String)
            reportParam.put("customerAddress", purchase.address)
            reportParam.put("customerCity", purchase.city)
            reportParam.put("customerState", purchase.state)
            reportParam.put("invoiceDate",new Date())

            // compiles jrxml
            JasperCompileManager.compileReportToFile(reportName);
            // fills compiled report with parameters and a connection
            JasperPrint print = JasperFillManager.fillReport(dotJasperFileName, reportParam, dataSource);

            pdfStream = new ByteArrayOutputStream();
            // exports report to pdf
            JRExporter exporter = new JRPdfExporter()
            exporter.setParameter(JRExporterParameter.JASPER_PRINT, print)
            exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, pdfStream) // your output goes here

            exporter.exportReport()

        } catch (Exception e) {
            println e
            println e.message
            println "----PRINTED E -----"
        } finally {
            return pdfStream
        }
    }


    def save_purchase = {
        def exist = Purchase.findByTxnId(params.txn_id)
        def user = User.get(springSecurityService.currentUser.id)

        if(exist) {
            println '----------------- EXISTS!! ------------------'
            return [purchase: exist, products:  exist.products, user: user]
        }

        println "---------------------- TEST --------------------"
        def total = new BigDecimal(params.payment_gross)
        println total
        println params.txn_id
        def purchase = new Purchase(
                txnId: params.txn_id,
                user:user,
                total: total,
                address: params.address_street,
                city: params.address_city,
                zip: params.address_zip,
                state: params.address_state
        )
        purchase.save(failOnError: true, flush: true)
        purchase.products = []
        user.carts.each { cart ->
            // let's add this to purchases:
            def pp = new PurchaseProduct(
                    price: cart.product.price,
                    product: cart.product,
                    quantity: cart.quantity,
                    purchase: purchase)
            pp.save(failOnError: true, flush: true)
            purchase.products.add(pp)
        }
        purchase.refresh()
//        purchase.save(flush:true)
        def items = user.carts
        user.carts = null
        items.each {
            it.delete(flush:true)
        }

        user.refresh()


        // EMAIL SUPPLIERS:
        def sendTo = []
        sendTo.add("lrojas94@gmail.com")
        def supplyRole = Role.findByAuthority("ROLE_SUPPLY")
        def users = UserRole.findAllByRole(supplyRole)
        users.each {
            sendTo.add(it.user.email)
        }

        sendMail {
            multipart true
            subject "Dispatch Request"
            text "You will be finding a dispatch request attached bellow."
            to sendTo
            from "grailserp@gmail.com"
            attach "dispatch.pdf", "application/pdf", this.generate_dispatch_report(purchase).toByteArray()
        }

        [purchase: purchase, products:  purchase.products, user: user]

    }

    def list = {
        User current = User.get(springSecurityService.currentUser.id)
        def purchases = null
        if (current.department.title == 'Administración' ||
                current.department.title == 'Almacén' || current.department.title == 'Ventas') {
            purchases = Purchase.list()
        } else {
            purchases = Purchase.findAllByUser(current)
        }

        [purchaseList: purchases]
    }

    @Secured(['ROLE_ADMIN'])
    def show() {
        def purchase = Purchase.findById(params.id)

        [purchase: purchase]
    }

    @Secured(['ROLE_USER'])
    def receive() {
        def purchase = Purchase.findById(params.id)
        purchase.isVerified = true
        redirect controller: "purchase", action: "list"
    }

}
