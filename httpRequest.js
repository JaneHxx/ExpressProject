var merge = require('lodash.merge');
const request = require('request');
const url = require('url');
var proxyTable = require('./proxyTable');

class Http {
    constructor() {}

    matchBaseUrl (url) {
        const proxy = Object.keys(proxyTable);
        for (let index = 0; index < proxy.length; index++) {
            const k = proxy[index];
            const i = url.indexOf(k);
            if (i >= 0) {
                const element = proxyTable[k];
                const newUrl = element.target + url.slice(i+k.length);
                return newUrl;
            }
        }
        return null;
    }

    send (req, res, next) {
        const url = req.url;
        if (Object.getOwnPropertyNames(req.body).length == 0) {
            this.get(req, res, next);
        } else {
            this.post(req, res, next);
        }
    }

    get (req, res, next) {
        let curl = url.parse(req.url);
        let search= curl.href;
        curl = this.matchBaseUrl(search);
        try {
            req.pipe(request({
                method: 'GET',
                uri: curl
            })).pipe(res);

        } catch (e) {
            next(e);
        }
    }

    post (req, res, next) {
        let curl= url.parse(req.url);
        let search= curl.href;
        curl = this.matchBaseUrl(search);
        let body = req.body;
        try {
            request.post({
                uri: curl,
                form: body
            }).pipe(res);

        } catch (e) {
            next(e);
        }
    }
}

module.exports = {
    http: new Http()
};

