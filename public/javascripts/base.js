//  post请求提交数据
// get提交数据
function submitGet(url, callback) {
    $.ajax({
        type: 'GET',
        url: url,
        beforeSend: function(request) {
            let token = localStorage.getItem('token');
            if (!token) token = new Date().valueOf();
            request.setRequestHeader("token", token);
        },
        success: function(data){
            callback(data);
        },
        error: function (data) {
            callback(data);
        }
    });
}

// post提交数据
function submitPost(url, param, callback) {
    $.ajax({
        type: 'POST',
        url: url,
        data: param,
        beforeSend: function(request) {
            let token = localStorage.getItem('token');
            if (!token) token = new Date().valueOf();
            request.setRequestHeader("token", token);
        },
        success: function(data){
            callback(data);
        },
        error: function (data) {
            callback(data);
        }
    });
}

// 格式化文件大小显示文字
function getSize (size) {
    return size > 1024
        ? size / 1024 > 1024
            ? size / (1024 * 1024) > 1024
                ? (size / (1024 * 1024 * 1024)).toFixed(2) + 'GB'
                : (size / (1024 * 1024)).toFixed(2) + 'MB'
            : (size / 1024).toFixed(2) + 'KB'
        : (size).toFixed(2) + 'B';
}