var db = require('../sqlConfig');
const connection = db.connection();

class FileModel {

    constructor(file) {
        if (!file) return;
        this.fileName = file.fileName;
        this.filePath = file.path;
        this.fileSize = file.size;
        this.originalName = file.originalFilename;
        this.fileType = this.originalName.substring(this.originalName.lastIndexOf('.')+1);
    }

    // 新增
    save (callback) {
        var file = {
            fileName: this.fileName,
            filePath: this.filePath,
            fileSize: this.fileSize,
            originalName: this.originalName,
            fileType: this.fileType
        };
        var insertFile_Sql = "INSERT INTO sys_user_file(fileName,filePath,fileSize,originalName,fileType) VALUES(?,?,?,?,?)";
        db.operate(connection, insertFile_Sql, [file.fileName, file.filePath, file.fileSize, file.originalName, file.fileType], function (err, result) {
            if (err) {
                console.log("insertFile_Sql Error: " + err.msg);
                throw err;
                callback(err, null);
            }
            // db.close(connection);
            console.log("invoked[save]");
            callback(err,result);
        });
    }

    // 获取全部数据
   getAll (callback) {
       var getAll_Sql = "SELECT * FROM sys_user_file";
       db.operate(connection, getAll_Sql, [], function (err, result) {
            if (err) {
                console.log("getAll_Sql Error: " + err.msg);
                throw err;
                callback(err, null);
            }
            // db.close(connection);
            console.log("invoked[getAll_Sql]");
            callback(err,result);
        });
    }

    // 通过id获取文件信息
    getFileById (id, callback) {
        var getFile_Sql = "SELECT * FROM sys_user_file WHERE id = ?";
        db.operate(connection, getFile_Sql, [id], function (err, result) {
            if (err) {
                console.log("getAll_Sql Error: " + err.msg);
                throw err;
                callback(err, null);
            }
            // db.close(connection);
            console.log("invoked[getAll_Sql]");
            callback(null, result);
        });
    }
}

module.exports = FileModel;