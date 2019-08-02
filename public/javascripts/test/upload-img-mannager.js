$(function () {
    $('#file').change(UpladFile);
    showFileList();
});

// 展示上传文件数据
function showFileList() {
    submitGet('/fileUpload/file/list', function (data) {
        if (data.code == 0) {
            traverseFileList(data.list);
        } else {
            traverseFileList([]);
        }
    });

}

// 遍历上传文件数据
function traverseFileList(fileList) {
    let fileTable = document.querySelector('#fileList tbody');
    let tr_html = '';
    for (let num = 0; num < fileList.length; num++) {
        tr_html += `<tr>
                    <td class="active">${num}</td>
                    <td class="success">${fileList[num].originalName}</td>
                    <td class="warning">${getSize(fileList[num].fileSize)}</td>
                    <td class="info"><button type="button" class="btn btn-link" onclick="downloadFile(${fileList[num].id})">下载</button></td></tr>`;
    }
    fileTable.innerHTML = tr_html;
}

// 文件下载
function downloadFile(fileId) {
    var url = '/fileUpload/download';
    var xhr = new XMLHttpRequest();
    xhr.open('POST', url, true);        // 也可以使用POST方式，根据接口
    xhr.responseType = "blob";    // 返回类型blob
    // 定义请求完成的处理函数，请求前也可以增加加载框/禁用下载按钮逻辑
    xhr.onload = function () {
        // 请求完成
        if (this.status === 200) {
            // 返回200
            var blob = this.response;
            var reader = new FileReader();
            reader.readAsDataURL(blob);    // 转换为base64，可以直接放入a表情href
            reader.onload = function (e) {
                // 转换完成，创建一个a标签用于下载
                var linkElement = document.createElement('a');
                linkElement.download = 'data.xlsx';
                linkElement.href = e.target.result;
                $("body").append(linkElement);    // 修复firefox中无法触发click
                if (typeof (MouseEvent) == 'function') {
                    var event = new MouseEvent("click", {
                        "view": window,
                        "bubbles": true,
                        "cancelable": false
                    });
                    linkElement.dispatchEvent(event);
                } else if (navigator.appVersion.toString().indexOf('.NET') > 0) {
                    window.navigator.msSaveBlob(blob, filename);
                }
                $(linkElement).remove();
            }
        }
    };
    // 发送ajax请求
    xhr.send({'fileId': fileId});
    // $.post('/fileUpload/download', {'fileId': fileId}, (data, status, xhr) => {
    //     if (data.code == 500) {
    //         alert(data.msg);
    //     } else {
    //         console.log(xhr);
    //         var contentType = xhr.getResponseHeader('Content-Type');
    //         var contentDisposition = xhr.getResponseHeader('Content-Disposition');
    //         var filename = decodeURIComponent(contentDisposition.split(';')[1].split('=')[1]);
    //         var linkElement = document.createElement('a');
    //         try {
    //             // var buf = Buffer.from(data, 'binary')
    //             // let type = 'application/octet-stream';
    //             var blob = new Blob([data],{type: 'image/jpeg'});
    //             var url = window.URL.createObjectURL(blob);
    //             linkElement.setAttribute('href', url);
    //             linkElement.setAttribute("download", filename);
    //             if (typeof (MouseEvent) == 'function') {
    //                 var event = new MouseEvent("click", {
    //                     "view": window,
    //                     "bubbles": true,
    //                     "cancelable": false
    //                 });
    //                 linkElement.dispatchEvent(event);
    //             } else if (navigator.appVersion.toString().indexOf('.NET') > 0) {
    //                 window.navigator.msSaveBlob(blob, filename);
    //             }
    //         } catch (e) {
    //             console.error(e.message);
    //         }
    //     }
    // });

    // submitPost('/fileUpload/download', {'fileId': fileId}, (data) => {
    //     if (data.code == 500) {
    //         alert(data.msg);
    //     } else {
    //         console.log(data);
    //         /*****a标签下载*****/
    //         // linkElem.href = data.filePath;
    //         // linkElem.download = data.originalName;
    //         // document.body.appendChild(linkElem);
    //         // // 触发点击
    //         // linkElem.click();
    //         // // 然后移除
    //         // document.body.removeChild(linkElem);
    //         }
    // });
}

/*
        三个参数
        file：一个是文件(类型是图片格式)，
        w：一个是文件压缩的后宽度，宽度越小，字节越小
        objDivOrCallback：一个是容器或者回调函数
        photoCompress()
         */
function photoCompress(file,w,objDivOrCallback) {
    var ready = new FileReader()
    /*开始读取指定的Blob对象或File对象中的内容. 当读取操作完成时,readyState属性的值会成为DONE,如果设置了onloadend事件处理程序,则调用之.同时,result属性中将包含一个data: URL格式的字符串以表示所读取文件的内容.*/
    ready.readAsDataURL(file)
    ready.onload = function() {
        var re = this.result
        canvasDataURL(re, w, objDivOrCallback)
    }
}

function canvasDataURL(path, obj, callback) {
    var img = new Image()
    img.src = path
    img.onload = function(){
        var that = this
        // 默认按比例压缩
        var w = that.width,
            h = that.height,
            scale = w / h
        w = obj.width || w
        h = obj.height || (w / scale)
        var quality = 0.7  // 默认图片质量为0.7
        //生成canvas
        var canvas = document.createElement('canvas')
        var ctx = canvas.getContext('2d')
        // 创建属性节点
        var anw = document.createAttribute("width")
        anw.nodeValue = w
        var anh = document.createAttribute("height")
        anh.nodeValue = h
        canvas.setAttributeNode(anw)
        canvas.setAttributeNode(anh)
        ctx.drawImage(that, 0, 0, w, h)
        // 图像质量
        if(obj.quality && obj.quality <= 1 && obj.quality > 0) {
            quality = obj.quality
        }
        // quality值越小，所绘制出的图像越模糊
        var base64 = canvas.toDataURL('image/jpeg', quality)
        // 这里不能直接quality: 0.2，因为这样就相当于还是在原来的大小的基础上压缩
        var bl = convertBase64UrlToBlob(base64)
        // 如果还大于1M，继续压缩--代码待优化，可以减去重复生成文件和转码的过程
        if (bl.size/1024 > 1025) {
            // 其实也可以在这里直接写一个匹配压缩比直到大小小于1的方法
            photoCompress(bl, {
                quality: 0.5 * obj.quality
            }, callback)
        } else {
            callback(bl)
        }
        // 回调函数返回base64的值--改为返回文件对象
        // callback(base64)
    }
}
/**
 * 将以base64的图片url数据转换为Blob
 * @param urlData
 *            用url方式表示的base64图片数据
 */
function convertBase64UrlToBlob(urlData) {
    var arr = urlData.split(','), mime = arr[0].match(/:(.*?);/)[1],
        bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n)
    while(n--) {
        u8arr[n] = bstr.charCodeAt(n)
    }
    return new Blob([u8arr], {type:mime})
}


var xhr
//上传文件方法
function UpladFile() {
    var fileObj = document.getElementById("file").files[0] // js 获取文件对象
    var url = "/fileUpload/file/uploading" // 接收上传文件的后台地址

    var form = new FormData() // FormData 对象

    if(fileObj.size/1024 > 1025) { //大于1M，进行压缩上传
        photoCompress(fileObj, {
            // 这里还有一种方案，那就是这里的quality改为计算压缩比（由于压缩比和文件大小并不是正比例关系，所有可以保险起见再乘以一个系数）
            // 压缩比计算的方案:quality: 1024*0.7/fileObj.size--0.7是保险系数--这些参数可以进一步封装
            quality: 0.2
            // }, function(base64Codes){
            // 修改为返回文件对象
        }, function(bl){
            debugger
            //console.log("压缩后：" + base.length / 1024 + " " + base);
            // var bl = convertBase64UrlToBlob(base64Codes)
            // form.append("file", bl, "file_"+Date.parse(new Date())+".jpg"); // 文件对象
            form.append("multipartFile", bl, "file_"+Date.parse(new Date())+".jpg") // 文件对象
            xhr = new XMLHttpRequest()  // XMLHttpRequest 对象
            xhr.open("post", url, true) //post方式，url为服务器请求地址，true 该参数规定请求是否异步处理。
            xhr.setRequestHeader("enctype", "multipart/form-data") // 设置请求头
            xhr.setRequestHeader("Authorization", "Bearer 8d782bb1-768f-4fa7-80d2-5e2b6d6a6f64") // 设置请求头
            // open后才可以设置头
            xhr.onload = uploadComplete //请求完成
            xhr.onerror =  uploadFailed //请求失败

            xhr.upload.onprogress = progressFunction//【上传进度调用方法实现】
            xhr.upload.onloadstart = function(){//上传开始执行方法
                ot = new Date().getTime()   //设置上传开始时间
                oloaded = 0//设置上传开始时，以上传的文件大小为0
            };

            xhr.send(form) //开始上传，发送form数据
        })
    } else { //小于等于1M 原图上传
        // form.append("file", fileObj) // 文件对象
        form.append("multipartFile", fileObj) // 文件对象
        xhr = new XMLHttpRequest()  // XMLHttpRequest 对象
        xhr.open("post", url, true) //post方式，url为服务器请求地址，true 该参数规定请求是否异步处理。
        xhr.setRequestHeader("enctype", "multipart/form-data") // 设置请求头
        xhr.setRequestHeader("Authorization", "Bearer 8d782bb1-768f-4fa7-80d2-5e2b6d6a6f64") // 设置请求头
        // open后才可以设置头
        xhr.onload = uploadComplete //请求完成
        xhr.onerror =  uploadFailed //请求失败

        xhr.upload.onprogress = progressFunction //【上传进度调用方法实现】
        xhr.upload.onloadstart = function() {//上传开始执行方法
            ot = new Date().getTime()   //设置上传开始时间
            oloaded = 0//设置上传开始时，以上传的文件大小为0
        }

        xhr.send(form) //开始上传，发送form数据
    }
}

// 无论上传成功还是失败，均重置数据
function resetUploadData() {
    document.getElementById("file").value = '';
    document.getElementById("progressBar").value = 0;
    document.getElementById("percentage").innerHTML = '';
}

//上传成功响应
function uploadComplete(evt) {
    //服务断接收完文件返回的结果
    var data = eval("(" + evt.target.responseText + ")");
    showFileList();
    if(data.files) {
        uploadSuccess()
    } else {
        uploadFailed()
    }
}
//上传失败
function uploadFailed(evt) {
    resetUploadData();
    alert("上传失败！")
}
//上传成功
function uploadSuccess(evt) {
    resetUploadData();
    alert("上传成功！")
}
//取消上传
function cancleUploadFile(){
    xhr.abort()
}

//上传进度实现方法，上传过程中会频繁调用该方法
function progressFunction(evt) {
    var progressBar = document.getElementById("progressBar")
    var percentageDiv = document.getElementById("percentage")
    // event.total是需要传输的总字节，event.loaded是已经传输的字节。如果event.lengthComputable不为真，则event.total等于0
    if (evt.lengthComputable) {//
        progressBar.max = evt.total
        progressBar.value = evt.loaded
        percentageDiv.innerHTML = Math.round(evt.loaded / evt.total * 100) + "%"
    }
    var time = document.getElementById("time")
    var nt = new Date().getTime()//获取当前时间
    var pertime = (nt-ot)/1000 //计算出上次调用该方法时到现在的时间差，单位为s
    ot = new Date().getTime() //重新赋值时间，用于下次计算
    var perload = evt.loaded - oloaded //计算该分段上传的文件大小，单位b
    oloaded = evt.loaded//重新赋值已上传文件大小，用以下次计算
    //上传速度计算
    var speed = perload/pertime//单位b/s
    var bspeed = speed
    var units = 'b/s'//单位名称
    if(speed/1024>1) {
        speed = speed/1024
        units = 'k/s'
    }
    if(speed/1024>1) {
        speed = speed/1024
        units = 'M/s'
    }
    speed = speed.toFixed(1)
    //剩余时间
    var resttime = ((evt.total-evt.loaded)/bspeed).toFixed(1)
    time.innerHTML = '，速度：'+speed+units+'，剩余时间：'+resttime+'s'
    if(bspeed==0) time.innerHTML = '上传已取消'
}