
/**
 * Reference:
 *  - https://es6.ruanyifeng.com
 */ 

// 1. let 和 const 命令

console.log("1.1 > var vs let");
/**
 * var: 声明的变量是所在代码区域有效
 * let: 声明的变量只在它所在的代码块有效
 */
function test_var_vs_let() {
    {
        var a = 1;
        let b = 10;
    }
    
    console.log("   a = " + a);
    // console.log("    b =  " + b); // ReferenceError: b is not defined
}

test_var_vs_let();
// console.log(a); // ReferenceError: a is not defined

console.log("1.2> var for")
/**
 * 循环使用 var i, 指向同一个 i
 */
function test_var_for() {
    var a = [];
    for (var i = 0; i < 10; i++) {
        a[i] = function() {
            console.log("   var i = " + i);
        };
    }
    console.log("   var for end i = " + i);
    
    for (let i = 0; i < 10; i++) {
        // console.log(i);
        a[i]();
    }
}
test_var_for();

console.log("1.3> let for")
function test_let_for() {
    var a = [];
    for (let i = 0; i < 10; i++) {
        a[i] = function() {
            console.log("   let i = " + i);
        }
    }
    // console.log("let for end i = " + i); // ReferenceError: i is not defined

    for (let i = 0; i < 10; i++) {
        // console.log(i);
        a[i]();
    }
}
test_let_for();

console.log("1.4> let 不存在变量提升");
function test_var_let_up() {
    console.log("   " + foo);
    var foo = 2;
    console.log("   " + foo);

    // console.log(bar); // ReferenceError: Cannot access 'bar' before initialization
    let bar = 2;
    console.log("   " + bar);
}
test_var_let_up();

console.log("1.5> 暂时性死区")
/**
 * TDZ: temporal dead zone (暂时性死区)
 * 
 * - 如果区块中存在let和const命令，这个区块对这些命令声明的变量，从一开始就形成了封闭作用域。凡是在声明之前就使用这些变量，就会报错。
 * - “暂时性死区”也意味着typeof不再是一个百分之百安全的操作。
 * - 暂时性死区的本质就是，只要一进入当前作用域，所要使用的变量就已经存在了，但是不可获取，只有等到声明变量的那一行代码出现，才可以获取和使用该变量。
 */
function test_temporal_death() {
    var tmp = 1243;
    if (true) {
        // tmp = 'abc'; // ReferenceError: Cannot access 'tmp' before initialization
        // typeof tmp; // ReferenceError: Cannot access 'tmp' before initialization
        console.log("   typeof undeclared variable: " + typeof undeclared_variable);
        let tmp;
        console.log("   " + tmp);

        tmp = 123;
        console.log("   " + tmp);
    }

    function bar1(x = y, y = 2) {
        return[x, y];
    }
    // bar1(); // ReferenceError: Cannot access 'y' before initialization

    function bar2(x = 2, y = 2) {
        return[x, y];
    }
    console.log("   bar2 = " + bar2());

    var x = x;

    // let x = x; // ReferenceError: Cannot access 'x' before initialization
}
test_temporal_death();

console.log("1.6> 不允许重复声明");
/**
 * let不允许在相同作用域内，重复声明同一个变量。
 */
function test_repetition_declare_variable() {
    let a = 10;
    // var a = 1; // SyntaxError: Identifier 'a' has already been declared

    function func1(arg) {
        // let arg = 11; // SyntaxError: Identifier 'arg' has already been declared
        console.log("   arg1 = " + arg);
    }
    func1(1);
    
    function func2(arg) {
        {
            let arg = 22;
            console.log("   arg2 = " + arg);
        }
    }
    func2(2);
}
test_repetition_declare_variable();

console.log("1.7> 为什么需要块级作用域?")
function test_es5_block() {
    var tmp = new Date();
    console.log("   " + tmp);

    // 变量提升，导致内层的tmp变量覆盖了外层的tmp变量。
    function f() {
        console.log("   tmp: " + tmp);
        if (false) {
            var tmp = "hello world!";
        }
        console.log("   override tmp: " + tmp);
    }
    f();

    var s = "hello";
    // 用来计数的循环变量泄露为全局变量
    for (var i = 0; i < s.length; i++) {
        console.log("   " + s[i]);
    }
    console.log(i);
}
test_es5_block();

console.log("1.8> ES6 的块级作用域")
function test_es6_block() {
    let n = 5;
    if (true) {
        let n = 10;
        console.log("   inner n = " + n);
    }
    console.log("   outer n = " + n);

    // 允许块级作用域的任意嵌套。
    {{{{
        {let insane = "Hello World";}
        // console.log(insane); ReferenceError: insane is not defined
    }}}}

    // 内层作用域可以定义外层作用域的同名变量。
    {{{{
        let insane = "Hello outer!";
        {let insane = "Hello inner!"}
    }}}}

    // 匿名立即执行函数表达式（匿名 IIFE）不再必要了。
    (function() {
        var tmp = " IIFE tmp";
        console.log(tmp);
    }());

    {
        let tmp = " let tmp";
        console.log(tmp);
    }
}
test_es6_block();

console.log("1.9> 块级作用域与函数声明")
function test_es6_func() {
    function f() {
        
    }
}