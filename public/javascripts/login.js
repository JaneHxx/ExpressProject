$(function () {
    $('#login').click(function () {
        var username = $('#inputUsername').val();
        var password = $('#inputPassword').val();
        submitPost({
            username: username,
            password: password
        }, '/practise1/sys/login', function (data) {  // /user/login
            if (data.code != 0) {
                alert(data.msg);
            }
            if (data.code == 0) {
                localStorage.setItem('token', data.token);
                if(confirm(data.msg)) window.location.href='/';
            }
        });
    });
});






