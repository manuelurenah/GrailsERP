package grailserp

import grailserp.reports.ArticlePurchase
import net.sf.jasperreports.engine.JRExporter
import net.sf.jasperreports.engine.JRExporterParameter
import net.sf.jasperreports.engine.JasperCompileManager
import net.sf.jasperreports.engine.JasperFillManager
import net.sf.jasperreports.engine.JasperPrint
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource
import net.sf.jasperreports.engine.export.JRPdfExporter
import org.apache.commons.io.output.ByteArrayOutputStream

class ReportsController {


    def generate_invoice = {
        def purchase = Purchase.findById(params.id as int)
        println "------------ STARTING REPORT ----------------"
        ByteArrayOutputStream pdfStream = null
        try {
            println "------------------ REPORT IS BEING GENERATED --------------------"
            String reportName, jrxmlFileName, dotJasperFileName
            jrxmlFileName = "Invoice"
            reportName = grailsApplication.mainContext.getResource("reports/${jrxmlFileName}.jrxml").file.getAbsoluteFile()
            dotJasperFileName = grailsApplication.mainContext.getResource("reports/${jrxmlFileName}.jasper").file.getAbsoluteFile()
            println reportName
            // Report parameter

            Map<String, Object> reportParam = new HashMap<String, Object>()
            def listItems = ArticlePurchase.getArticlesFromPurchase(purchase)
            def dataSource = new JRBeanCollectionDataSource(listItems)

            reportParam.put("customerName", purchase.user.name + " " + purchase.user.lastname)
            reportParam.put("customerEmail", purchase.user.email)
            reportParam.put("invoiceNumber", "INV" + purchase.id as String)
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
            throw new GroovyRuntimeException("It's not possible to generate the pdf report.", e);
        } finally {
            //render(file: pdfStream.toByteArray(), contentType: 'application/pdf')
            render file: pdfStream.toByteArray(), fileName: 'DownloadReport.pdf', contentType: 'application/pdf'
        }
    }

    def generate_dispatch = {
        def purchase = Purchase.findById(params.id as int)
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
            def dataSource = new JRBeanCollectionDataSource(listItems)

            reportParam.put("customerName", purchase.user.name + " " + purchase.user.lastname)
            reportParam.put("customerEmail", purchase.user.email)
            reportParam.put("invoiceNumber", "INV" + purchase.id as String)
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
            throw new GroovyRuntimeException("It's not possible to generate the pdf report.", e);
        } finally {
            //render(file: pdfStream.toByteArray(), contentType: 'application/pdf')
            render file: pdfStream.toByteArray(), fileName: 'DownloadReport.pdf', contentType: 'application/pdf'
        }
    }
}
