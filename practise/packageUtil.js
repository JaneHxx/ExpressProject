exports.install = function (projectPath, packageName, save, dev) {
    const npm = 'npm'
    const args = ['install']
    args.push(packageName)
    if (save) args.push('--save')
    if (dev) args.push('--save-dev')
    console.log(projectPath);
    var ls = require('child_process').spawn(process.platform === 'win32' ? 'npm.cmd' : npm, args, {
        stdio: 'inherit',
        cwd: projectPath
    });
    ls.stdout.on('data', function (data) {
        console.log('stdout: ' + data)
    })
    ls.stderr.on('data', function (err) {
        console.log('stderr: ' + err)
    })
    ls.once('close', function () {
        console.log('install success...')
    })
};