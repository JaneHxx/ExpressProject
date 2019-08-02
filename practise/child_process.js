var path = require('path');
function spawnRun() {
    let spawn = require('child_process').spawn;
    let projectPath = path.resolve(__dirname);
    const args = [];
    const ls = spawn('dir',args,{
        stdio: 'inherit',
        cwd: projectPath
    });

    ls.stdout.on('data', (data) => {
        console.log(`stdout: ${data}`);
    });

    ls.stderr.on('data', (data) => {
        console.log(`stderr: ${data}`);
    });

    ls.on('close', (code) => {
        console.log(`子进程退出，退出码 ${code}`);
    });
}

module.exports = {
    spawnRun: spawnRun
};
