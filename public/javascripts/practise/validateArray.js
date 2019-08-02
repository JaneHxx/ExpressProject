/**
 * 验证数组
 */
function fnValidateArr() {
  console.log('isArray===', Array.isArray(arguments));
  console.log('isArray===', Array.isArray([1, 2, 3, 4]));
  console.log('instanceof===', arguments instanceof Array);
  console.log('instanceof===', [1, 2, 3, 4] instanceof Array);
  console.log('Object.prototype.toString.call===', Object.prototype.toString.call(arguments));
  console.log('Object.prototype.toString.call===', Object.prototype.toString.call([1,2,3,4]));
  console.log('constructor===', arguments.constructor === Array);
  arguments.constructor = Array;
  console.log('constructor===', arguments.constructor === Array);
} 

// fnValidateArr([1, 2, 3, 4]);


/**
 * 真实数组和类数组的转化
 */
function arrayLikeTransform() {
    // 类数组
    let arrayLike1 = document.querySelectorAll('div');
    console.log(arrayLike1);
    /**
     * 第一种方法
     * @type {NodeListOf<ElementTagNameMap["div"]>}
     */
    let arrayLike2 = Array.prototype.slice.call(arrayLike1);
    console.log(arrayLike2);

    /**
     * 第二种方法
     */
    console.log([...arrayLike1]);

    /**
     * 第三种方法
     */
    let arrayLike3 = Array.from(arrayLike1);
    console.log(arrayLike3);
}
// arrayLikeTransform();

function assignObj() {
    let obj = {
        name: '111',
        age: 123,
        sex: '女'
    };
    let obj2 = obj;
    obj2.name = '222234';
    console.log(obj.name);
    console.log(obj2.name);
}
// assignObj();

function assignObj1() {
    var a = { n : 1};
    var b = a;
    a.x = a;
    console.log(a.x);
    a = {n:  2};
    console.log(a.x);      //undefined
    console.log(b.x);     //{n:2}
}
assignObj1();

/**
 * 实现对数组乱序
 */
function outOrder() {
    var a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    var sign = 1;
    a.sort(function(a, b) {
        return Math.random() - 0.5
    });
    console.log(a);
}
// outOrder();
