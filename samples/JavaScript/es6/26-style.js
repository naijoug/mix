
/**
 * 1. 块级作用域
 *      - 建议不再使用var命令，而是使用let命令取代。
 *      - - 在let和const之间，建议优先使用const，尤其是在全局环境，不应该设置变量，只应设置常量。
 */

console.log('1> 块级作用域')
function test_block() {
    const [a, b, c] = [1, 2, 3]
    console.log(a, b, c)
}
test_block()

/**
 * 2. 字符串
 *      - 静态字符串一律使用单引号或反引号，不使用双引号。
 *      - 动态字符串使用反引号。
 */

console.log('2> 字符串')
function test_string() {
    const a = 'a'
    const b = `b and ${a}`
    console.log('a: ' + a)
    console.log(`b: ${b}`)
}
test_string()

/**
 * 3. 解构赋值
 *      - 使用数组成员对变量赋值时，优先使用解构赋值。
 */

console.log('3> 解构赋值')
function test_unpack() {
    const arr = [1, 2, 3, 4]
    const a = arr[0]
    const b = arr[1]
    const [one, two, three, four] = arr
    console.log(a, b)
    console.log(one, two, three, four)
}
test_unpack()

/**
 * 4. 对象
 *      - 单行定义的对象，最后一个成员不以逗号结尾。多行定义的对象，最后一个成员以逗号结尾。
 *      - 对象尽量静态化，一旦定义，就不得随意添加新的属性。如果添加属性不可避免，要使用Object.assign方法。
 *      - 如果对象的属性名是动态的，可以在创造对象的时候，使用属性表达式定义。
 */

/**
 * 5. 数组
 *      - 使用扩展运算符（...）拷贝数组。
 *      - 使用 Array.from 方法，将类似数组的对象转为数组。
 */

/**
 * 6. 函数
 *      - 立即执行函数可以写成箭头函数的形式。
 *      - 那些使用匿名函数当作参数的场合，尽量用箭头函数代替。
 *      - 箭头函数取代Function.prototype.bind，不应再用 self/_this/that 绑定 this。
 *      - 所有配置项都应该集中在一个对象，放在最后一个参数，布尔值不可以直接作为参数。
 *      - 不要在函数体内使用 arguments 变量，使用 rest 运算符（...）代替。
 *      - 使用默认值语法设置函数参数的默认值。
 */

console.log('6> 函数');
(() => {
    console.log('IIEF =>')
})();

function test_func() {
    let res1 = [1, 2, 3].map((x) => {
        return x * x
    })
    console.log('res1:', res1)
    let res2 = [1, 2, 3].map(x => x * x)
    console.log('res2:', res2)
}
test_func()

function test_arguments() {
    const args = Array.prototype.slice(arguments)
    console.log('arguments:', args)
}
test_arguments(1, 2, 3, 4)

function test_args(...args) {
    console.log('args:', args)
}
test_args(1, 2, 3, 4)

/**
 * 8. Map
 *      - 注意区分 Object 和 Map，只有模拟现实世界的实体对象时，才使用 Object。
 *      - 需要key: value的数据结构，使用 Map 结构。因为 Map 有内建的遍历机制。
 */

function test_map() {
    // const arr = ["one", "two", "three", "four"]
    let map = new Map();
    map = {"one": 1, "two": 2, "three":3, 'four':4}
    console.log("keys:")
    for (let key of map.keys()) {
        console.log(key)
    }
    console.log("values:")
    for(let value of map.values()) {
        console.log(value)
    }
    console.log('entries:')
    for (let item of map.entries()) {
        console.log(item)
    }
}
// test_map()

/**
 * 8. Class
 *      - 总是用 Class，取代需要 prototype 的操作。因为 Class 的写法更简洁，更易于理解。
 *      - 使用extends实现继承，因为这样更简单，不会有破坏instanceof运算的危险。
 */

/**
 * 9. 模块
 *      - ES6 模块语法是 JavaScript 模块的标准写法，坚持使用这种写法，取代 Node.js 的 CommonJS 语法。
 *      - 如果模块只有一个输出值，就使用export default
 *      - 如果模块有多个输出值，除非其中某个输出值特别重要，否则建议不要使用export default，即多个输出值如果是平等关系，export default与普通的export就不要同时使用。
 *      - 如果模块默认输出一个函数，函数名的首字母应该小写，表示这是一个工具方法
 *      - 如果模块默认输出一个对象，对象名的首字母应该大写，表示这是一个配置值对象。
 */

/**
 * 10. ESLint 使用
 *      - 
 */