var express = require('express');
var router = express.Router();
var multiparty = require('multiparty');
var util = require('util');
const crypto = require('crypto');
var fs = require('fs');
var FileModel = require('../../../Models/FileModel');
/* 上传页面. */
// router.get('/', function(req, res, next) {
//     //res.render('./views/index');
//     res.sendfile('./views/index.html');
// });
/* 上传 */
router.post('/file/uploading', function(req, res, next) {
    /* 生成multiparty对象，并配置上传目标路径 */
    var form = new multiparty.Form();
    /* 设置编辑 */
    form.encoding = 'utf-8';
    //设置文件存储路劲
    form.uploadDir = './public/download/';
    //设置文件大小限制
    form.maxFilesSize = 2 * 1024 * 1024;
    // form.maxFields = 1000;  //设置所有文件的大小总和
    //上传后处理
    form.parse(req, function(err, fields, files) {
        var filesTemp = JSON.stringify(files, null, 2);
        if(err) {
            console.log('parse error:' + err);
        }else {
            var inputFile = files.multipartFile[0];
            let fileModel = new FileModel(inputFile);
            let uploadedPath = inputFile.path;
            let originalFilename = inputFile.originalFilename;
            let fileType = originalFilename.substring(originalFilename.lastIndexOf('.')+1);
            let cipher = crypto.createHash('md5').update(new Date().valueOf() + '').digest('hex');
            let dstPath = './public/download/' + cipher + '.' + fileType;
            console.log(inputFile);
            fileModel.filePath = dstPath;
            fileModel.fileName = cipher + '.' + fileType;
            fileModel.save((err, result) => {
                if(err) {
                    console.log('rename error:' + err);
                } else {
                    //重命名为真实文件名
                    fs.rename(uploadedPath, dstPath, function(err) {
                        if(err) {
                            console.log('rename error:' + err);
                        }else {
                        }
                    });
                    console.log('rename success:');
                }
            });
        }
        res.writeHead(200, {'content-type': 'text/plain;charset=utf-8'});
        res.end(util.inspect({fields: fields, files: filesTemp}));
    })
});

// 文件下载
router.post('/download', function (req, res, next) {
    let fileModel = new FileModel();
    let responseJson = {};
    let fileId = req.body.fileId;
    // 检测文件是否存在
    fileModel.getFileById(fileId, (err, result) => {
       if (err) {
           responseJson.code = 500;
           responseJson.msg = '该文件不存在';
           return res.json(responseJson);
       } else {
           var file =result[0];
           //第二种方式
           var name = file.originalName;
           var path = file.filePath;
           var size = fs.statSync(path).size;
           // fs.readFile(path, function(isErr, data){
           //     if (isErr) {
           //         res.end("Read file failed!");
           //         return;
           //     }
           //     // res.setEncoding("binary");
               res.writeHead(200,{
                   'Content-Type': 'application/octet-stream', //告诉浏览器这是一个二进制文件
                   'Content-Disposition': 'attachment; filename=' + encodeURIComponent(name), //告诉浏览器这是一个需要下载的文件
               });
           //     res.end(data);
           // });
           var readStream = fs.createReadStream(path);
           readStream.setEncoding('utf8');
          readStream.pipe(res);
          readStream.on('close', function (data) {
              console.info('下载结果:' + data);
          });
       }
    });
});

// 获取当前上传列表数据
router.get('/file/list', function (req, res, next) {
    let fileModel = new FileModel();
    let responseJson = {};
    fileModel.getAll((err, result) => {
        if (err) {
            responseJson.code = 500;
            responseJson.list = [];
        } else {
            responseJson.code = 0;
            responseJson.list = result;
        }
        return res.send(responseJson).end();
    });
});
module.exports = router;