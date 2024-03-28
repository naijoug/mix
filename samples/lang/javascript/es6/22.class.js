
function Point1(x, y) {
    this.x = x;
    this.y = y;
}
Point1.prototype.toString = function() {
    return "(" + this.x + ", " + this.y + ")"; 
}
var p1 = new Point1(1, 1);
console.log("p1: " + p1);

/**
 * 类的数据类型就是函数，类本身就指向构造函数。
 */
class Point2 {
    constructor(x, y) {
        this.x = x;
        this.y = y;
    }

    toString() {
        return "(" + this.x + ", " + this.y + ")";
    }
}
var p2 = new Point2(2, 2);
console.log("p2: " + p2);
console.log("es6 class - typeof Point2: " + typeof Point2);
console.log("es6 class - Point2: " + Point2);
console.log("es6 class - Point2 prototype constructor: " + Point2.prototype.constructor);
console.log(Point2 == Point2.prototype.constructor)
console.log(Point2.constructor === Point2.prototype.constructor)

console.log(">> Object.assign()")
// Object.assign()方法可以很方便地一次向类添加多个方法
Object.assign(Point2.prototype, {
    toValue() {}
})

// 类的内部所有定义的方法，都是不可枚举的（non-enumerable）
console.log("prototype: " + Object.keys(Point2.prototype))
console.log("getOwnPropertyNames: " + Object.getOwnPropertyNames(Point2.prototype))

/**
 * constructor() 方法
 * 一个类必须有constructor()方法，如果没有显式定义，一个空的constructor()方法会被默认添加。
 */

// constructor()方法默认返回实例对象（即this），完全可以指定返回另外一个对象
class Foo {
    constructor() {
        return Object.create(null)
    }
}
let foo = new Foo()
console.log("foo is Foo: " + (foo instanceof Foo))