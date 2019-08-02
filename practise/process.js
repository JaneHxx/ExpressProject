function sigintRun() {
    process.on('SIGINT', function() {
        console.log('收到 SIGINT 信号。');
    });

    console.log('试着按下 ctrl + c');
    setTimeout(function() {
        console.log('end');
    }, 5000);
}

module.exports = {
    sigintRun: sigintRun
};


