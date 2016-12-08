/**
 * Created by MEUrena on 12/7/16.
 */

var Helpers = function(){
    var languageForDataTable = {
        search : "Buscar Entradas",
        paginate: {
            first:    'Inicio',
            previous: 'Anterior',
            next:     'Siguiente',
            last:     'Ultimo'
        },
        info : "Mostrando del _START_ al _END_ de un total de _TOTAL_ Entradas",
        lengthMenu : "Mostrar _MENU_ Entradas",
        emptyTable: "No hay datos a mostrar.",
        infoEmpty: ""
    };

    $('.submit-form').click(function (e) {
        e.preventDefault();
        var form = $(this).closest('form');
        console.log(form);
        form.submit();
    });

    var FormDataToJson = function(form){
        var formData = $(form).serializeArray();
        var jsonFormData = {};
        for(i in formData){
            jsonFormData[formData[i].name] = formData[i].value;
        }
        return jsonFormData;
    };

    return {
        FormDataToJson : FormDataToJson,
        DTLanguage: languageForDataTable
    };
};

$(document).ready(function() {
    var HelpersNamespace = Helpers();
    $('#products-table').dataTable({
        language: HelpersNamespace.DTLanguage,
        pageLength: 5,
        lengthMenu: [5,25,50],
        saveState: true,
        serverSide: true,
        ajax: {
            url : "/product/list",
            type: "POST",
            data: function(data){
                return JSON.stringify(data);
            }
        },
        columnDefs: [
            {
                targets : 0,
                data: function(row,type,val,meta){
                    var product = row;
                    var productContainer = $('#product-container').clone();
                    productContainer.attr("id","");
                    //add title:
                    productContainer.find('.product-title').append(product.title);
                    productContainer.find('.product-price').append('$ ' + product.price);
                    productContainer.find('.product-description').append(product.description);
                    // var img = productContainer.find('.img-responsive');
                    // img.attr("src",product.path);

                    return productContainer;
                },
                render: function(row,type,val,meta){
                    return row.html();
                }
            }
        ]
    });
});