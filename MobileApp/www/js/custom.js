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
                userInfo = data;
                if (data.access_token) {
                    // redirect:
                    $('#login').addClass('hide');
                    $('#charts').removeClass('hide');
                }
                else {
                    $('#login-error').text('Error with login. Please, check credentials and try again.');
                }
            },
            error: function(err) {
                alert("THERE WAS AN ERROR PERFORMING ACTION");
            }
        })
    });
});