var userInfo = {};

$(function() {
   // make login.js work:
    $('#login-form').submit(function(e) {
        e.preventDefault();
        $.ajax({
            method: 'POST',
            url: 'http://localhost:8080/api/login',
            data: JSON.stringify({
                username: $('#username').val(),
                password: $('#password').val()
            }),
            dataType: 'json',
            contentType: "application/json",
            success: function(data) {
                console.log(data);
                if (data.access_token) {
                    if(data.roles.indexOf('ROLE_ADMIN') === -1){
                        return swal('You are not an Admin!', 'Sorry, this application is only for ' +
                            'admin users.', 'error');
                    }
                    userInfo = data;
                    // redirect:
                    $('#login').addClass('hide');
                    $('#charts').removeClass('hide');
                    // open the thing:
                    $.ajax({
                        url: 'http://localhost:8080/api/datatable',
                        method: 'get',
                        dataType: 'html',
                        headers: {
                            "X-Auth-Token" : data.access_token,
                            "Authorization" : data.access_token,
                        },
                        success: function(data) {
                            $('#charts').html(data);
                        },
                        error: function(err) {
                            console.log(err);
                            swal('There\'s been an error.', 'It seems something went wrong.','error')
                        }

                    })
                }
                else {
                    $('#login-error').text('Error with login. Please, check credentials and try again.');
                }
            },
            error: function(err) {
                swal('There\'s been an error.', 'It seems something went wrong.','error')
            }
        })
    });
});