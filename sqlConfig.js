const mysql = require('mysql');
const dbConfig = require('./db');
let db = {};
db.connection = function () {
    let connection = mysql.createConnection(dbConfig.mysql);
    //数据库连接
    connection.connect (function(err) {
        if(err){
            // 如果是连接断开，自动重新连接
            if (err.code === 'PROTOCOL_CONNECTION_LOST') {
                db.connection();
            } else {
                console.error(err.stack || err);
                return;
            }
        }
    });
    return connection;
};
//关闭数据库
db.close = function (connection) {
    //关闭连接
    connection.end(function (err) {
        if (err) {
            throw err;
        } else {
            console.log('关闭连接');
        }
    });
};

db.operate = function (connection, sql, param, callback) {
    connection.query(sql, param, function (err,data) {
        if (err) {
            callback(err, null);
        }
        callback(null, data);
    })
};

exports = module.exports = db;
