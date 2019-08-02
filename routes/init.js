var fs = require("fs");
var path = require('path');
var httpRequest = require('../httpRequest');
var loadRoute = {
    path : './routes/',
    app : null,
    _cors: function () {
        // 引入cors，解决跨域问题
        this.app.use('*', function(req, res, next) {
            res.header('Access-Control-Allow-Origin', req.headers.origin);//注意这里不能使用 *
            res.header('Access-Control-Allow-Headers', 'Content-Type, Content-Length, Authorization, Accept, X-Requested-With , yourHeaderFeild');
            res.header("X-Powered-By",' 3.2.1');
            res.header('Access-Control-Allow-Credentials', true); // 允许服务器端发送Cookie数据
            res.header("Content-Type", "application/json;charset=utf-8");
            res.header('Access-Control-Allow-Methods', 'PUT, POST, GET, DELETE, OPTIONS');//设置方法
            if (req.method == 'OPTIONS') {
                return res.sendStatus(200).send('OK'); // 在正常的请求之前，会发送一个验证，是否可以请求。
            }
            else {
                next();
            }
        });
    },
    // 判断路由是否需要反向代理到Java服务器进行处理
    reverseProxy: function () {
      this.app.use('/', function (req, res, next) {
          const url = req.url;
          let not_found = true;
          let $http = httpRequest.http;
          if ($http.matchBaseUrl(url)) {
              not_found = false;
              $http.send(req, res, next);
          }
          if(not_found) {
              console.log('not_found_url: ', url);
              next();
          } else {
              console.log('proxy_url: ', url);
          }
      });  
    },
    listDir : function(dir){
        var fileList = fs.readdirSync(dir,'utf-8');
        for(var i=0;i<fileList.length;i++) {
            var stat = fs.lstatSync(dir + fileList[i]);
            if (stat.isDirectory()) {
                this.listDir(dir + fileList[i]  + '/');
            } else {
                this.loadRoute(dir + fileList[i]);
            }
        }
    },
    loadRoute : function(routeFile){
        var route = require(path.join(__dirname, routeFile.substring(8,routeFile.lastIndexOf('.'))));
        //完整的请求路径
        var routePath = routeFile.substring(15,routeFile.lastIndexOf('.'));
        if(routePath.length >= 5){
            //除去index的有效路径
            if(routePath.substring(routePath.length-5)=="index"){
                var validPath = routePath.substring(0,routePath.length-5);
                this.app.use(validPath,route);
                console.log('validPath = ' + validPath);
            }else{
                this.app.use(routePath,route);
                console.log('routePath = ' + routePath);
            }
        }else{
            this.app.use(routePath,route);
            console.log('routePath = ' + routePath);
        }

    },
    init : function(app,path){
        if(!app){
            console.error("系统主参数App未设置");
            return false;
        }
        this.app = app;
        this.path = path?path:this.path;
        // 解决跨域问题
        this._cors();
        // 本地反向代理
        this.reverseProxy();
        // 动态遍历路由
        this.listDir(this.path);
    }
};
module.exports = loadRoute;