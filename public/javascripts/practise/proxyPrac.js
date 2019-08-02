/**
 * 通过proxy解决对象属性为undefined的问题
 * 但是这会有一个小缺点，就是如果你确实要判断这个key是否存在只能够通过in操作符来判断，而不能够直接通过get来判断。
 */
(() => {
    let target = {};
    let handlers = {
        get (target, property) {
            target[property] = (property in target) ? target[property] : {};
            if (typeof target[property] === 'object' ) {
                return new Proxy(target[property], handlers);
            }
            return target[property];
        }
    };
    let proxy = new Proxy(target, handlers);
    console.log('z' in proxy.x.y);
    proxy.x.y.z = 'hello';
    console.log('z' in proxy.x.y);
    console.log(proxy.x.y.z);
})();

/**
 * 普通函数与构造函数的兼容
 */
(() => {
    class Test {
        constructor (a, b) {
            console.log('constructor', a, b);
        }
    }
    let proxyClass = new Proxy(Test, {
        apply (target, thisArg, argumentList) {
            return new (target.bind(thisArg, ...argumentList))();
        }
    });
    proxyClass(1, 2);
    new proxyClass(3, 4);
})();

/**
 * 如果想要明确禁止new, 使用constructor
 */
(() => {
    function add (a, b) {
        return a + b
    }

    let proxyNoNew = new Proxy(add, {
        construct (target, argumentsList, newTarget) {
            throw new Error(`Function ${target.name} cannot be invoked with 'new'`);
        }
    });

    console.log(proxyNoNew(1, 2));
    // console.log(new proxyNoNew(1, 3));
})();

/**
 * 运用代理封装fetch
 */
(() => {
    let handlers = {
        get (target, property) {
            if (!target.init) {
                // 初始化对象
                ['GET', 'POST'].forEach(method => {
                    target[method] = (url, params = {}) => {
                        return fetch(url, {
                            headers: {
                                'content-type': 'application/json'
                            },
                            mode: 'cors',
                            credentials: 'same-origin',
                            method,
                            ...params
                        }).then(response => response.json())
                    }
                })
            }
            return target[property]
        }
    };
    let API = new Proxy({}, handlers);
    // API.GET('XXX');
    // API.POST('XXX', {
    //     body: JSON.stringify({name: 1})
    // });
})();

/**
 * proxy实现一个简易的断言工具
 */
(() => {
    let assert = new Proxy({}, {
        set (target, message, value) {
            if (!value) console.error(message);
        }
    });
    // assert['Isn\'t true'] = false;
    assert['Less than 18'] = 18 >= 19;
})();

