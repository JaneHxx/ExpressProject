$(function () {
    $('#login').click(function () {
        var username = $('#inputUsername').val();
        var password = $('#inputPassword').val();
        submitPost({
            username: username,
            password: password
        }, '/user/register', function (data) {
            if (data.code != 0) {
                alert(data.msg);
            }
            if (data.code == 0) {
                if(confirm(data.msg)) window.location.href='/login';
            }
        });
    });
});






