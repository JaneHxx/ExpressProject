var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
   res.type('html');
   res.render('index');
});

// GET login page.
router.get('/login', function(req, res, next) {
    res.type('html');
    res.render('login');
});

// GET register page.
router.get('/register', function(req, res, next) {
    res.type('html');
    res.render('register');
});


router.get('/test/upload-img-mannager', function (req, res, next) {
    res.type('html');
    res.render('test/upload-img-mannager');
});


module.exports = router;
