var express = require('express');
var router = express.Router();
const crypto = require('crypto');
// const hmac = crypto.createHmac('sha256', 'secret-key');
// const hash = crypto.createHash('sha256');
var User = require('../../../Models/UserModel');
var resjsondata = {};

router.post('/', function(req, res, next) {
    let username = req.body.username;
    let password = req.body.password;
    if (username == '' || password == '') {
        resjsondata.code = 1;
        resjsondata.msg = '用户名或密码不能为空!';
        return res.json(resjsondata);
    }
    let user = new User({'username': username, 'userpass': password});
    user.getUserInfoByName(username, password, function (err, result) {
        if (err || result.length == 0) {
            resjsondata.code = 500;
            resjsondata.msg = '用户名或密码不正确!';
            return res.json(resjsondata);
        }
        let salt = result[0].salt;
        // let cipher = crypto.createHash('sha256', salt).update(password).digest('hex');
        // let cipher = hmac.digest('hex');
        // console.log(cipher);
        resjsondata.code = 0;
        resjsondata.msg = '登录成功, 请稍后!';
        return res.status(200).send(resjsondata).end();
    });
    //https://my.oschina.net/KevinJay/blog/144776
});

module.exports = router;