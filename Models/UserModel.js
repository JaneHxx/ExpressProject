var db = require('../sqlConfig');
const connection = db.connection();

class User {

    constructor(user) {
        this.username = user.username;
        this.userpass = user.userpass;
    }

    // 新增
    save (callback) {
        var user = {
            username: this.username,
            userpass: this.userpass
        };
        var insertUser_Sql = "INSERT INTO dayincms_userinfo(username,userpass) VALUES(?,?)";
        db.operate(connection, insertUser_Sql, [user.username, user.userpass], function (err, result) {
            if (err) {
                console.log("insertUser_Sql Error: " + err.msg);
                throw err;
                return;
            }
            // db.close(connection);
            console.log("invoked[save]");
            callback(err,result);
        });
    }

    //根据用户名得到用户数量
   getUserNumByName (username, callback) {
        var getUserNumByName_Sql = "SELECT COUNT(1) AS num FROM dayincms_userinfo WHERE username = ?";
       db.operate(connection, getUserNumByName_Sql, [username], function (err, result) {
            if (err) {
                console.log("getUserNumByName Error: " + err.msg);
                throw err;
                return;
            }
           // db.close(connection);
            console.log("invoked[getUserNumByName]");
            callback(err,result);
        });
    };

    // 用户登录验证
   getUserInfoByName (username, userpass, callback) {
       var getUserByUserName_Sql = "SELECT * FROM sys_user WHERE username = ?";
       db.operate(connection, getUserByUserName_Sql, [username], function (err, result) {
            if (err) {
                console.log("getUserByUserName Error: " + err.msg);
                throw err;
                return;
            }
            // db.close(connection);
            console.log("invoked[getUserByUserName]");
            callback(err,result);
        });
    }
}

module.exports = User;