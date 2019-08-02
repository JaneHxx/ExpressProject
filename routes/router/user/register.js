var express = require('express');
var router = express.Router();
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
    user.save(function (err, result) {
      if (err) {
          resjsondata.code = 500;
          resjsondata.msg = '注册失败，请重新填写信息!';
          return res.json(resjsondata);
      }
      resjsondata.code = 0;
      resjsondata.msg = '注册成功, 请前往登录页进行登录!';
      return res.json(resjsondata);
    });
});

module.exports = router;