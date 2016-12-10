package grailserp

import grails.plugins.jasper.JasperExportFormat
import grails.plugins.jasper.JasperReportDef
import net.sf.jasperreports.engine.JRExporter
import net.sf.jasperreports.engine.JRExporterParameter
import net.sf.jasperreports.engine.JasperCompileManager
import net.sf.jasperreports.engine.JasperFillManager
import net.sf.jasperreports.engine.JasperPrint
import net.sf.jasperreports.engine.export.JRPdfExporter
import org.springframework.security.access.annotation.Secured

class HomeController {

    def dataSource

    @Secured(['ROLE_USER'])
    def index() {
        List<Product> productList = Product.list()
        [products: productList]
    }

    def generate_invoice() {
        ByteArrayOutputStream pdfStream = null
        try {
            String reportName, jrxmlFileName, dotJasperFileName
            jrxmlFileName = "as_sala_mu_alai_kum"
            reportName = grailsApplication.mainContext.getResource('reports/' + jrxmlFileName + '.jrxml').file.getAbsoluteFile()
            dotJasperFileName = grailsApplication.mainContext.getResource('reports/' + jrxmlFileName + '.jasper').file.getAbsoluteFile()

            // Report parameter
            Map<String, String> reportParam = new HashMap<String, String>()
            reportParam.put("detailsData", 'Report parameter [ detailsData ] value passed from application')
            // compiles jrxml
            JasperCompileManager.compileReportToFile(reportName)
            // fills compiled report with parameters and a connection
            JasperPrint print = JasperFillManager.fillReport(dotJasperFileName, reportParam, dataSource.getConnection())

            pdfStream = new ByteArrayOutputStream()

            // exports report to pdf
            JRExporter exporter = new JRPdfExporter()
            exporter.setParameter(JRExporterParameter.JASPER_PRINT, print)
            exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, pdfStream) // your output goes here

            exporter.exportReport()
            //println 'pdfStream = '+pdfStream.size()

        } catch (Exception e) {

            throw new RuntimeException("It's not possible to generate the pdf report.", e);
        } finally {
            //render(file: pdfStream.toByteArray(), contentType: 'application/pdf')
            render(file: pdfStream.toByteArray(), fileName: 'DownloadReport.pdf', contentType: 'application/pdf')
        }
    }
}
