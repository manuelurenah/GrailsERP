package grailserp

import grails.plugins.jasper.JasperExportFormat
import grails.plugins.jasper.JasperReportDef
import grailserp.reports.ArticlePurchase
import net.sf.jasperreports.engine.JRDataSource
import net.sf.jasperreports.engine.JREmptyDataSource
import net.sf.jasperreports.engine.JRExporter
import net.sf.jasperreports.engine.JRExporterParameter
import net.sf.jasperreports.engine.JasperCompileManager
import net.sf.jasperreports.engine.JasperFillManager
import net.sf.jasperreports.engine.JasperPrint
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource
import net.sf.jasperreports.engine.export.JRPdfExporter
import org.apache.commons.io.output.ByteArrayOutputStream
import org.springframework.security.access.annotation.Secured

class HomeController {

    def dataSource

    @Secured(['ROLE_USER','ROLE_ADMIN','ROLE_SALES','ROLE_SUPPLY'])
    def index() {
        [products: Product.list()]
    }

}
