
// - [通过 SIL 看 Swift 的方法派发](https://juejin.cn/post/7240859916402769979)

// Protocol Extension
//   协议扩展中的方法如果没有协议中申明，则不会进入函数 WTable 中，会直接进行静态派发。

protocol Animal {}

extension Animal {
    func speak() {
        print("test1")
    }
}

class Cat: Animal {
    func speak() {
        print("喵喵")
    }
}

let cat: Animal = Cat()
cat.speak()

// 父类未实现协议方法
//   WTable 没有生成显式声明的函数，所以父类未实现协议方法，子类的实现也不会被加入到 WTable 中。
//   子类的实现的协议方法，需要父类也实现才能被加入 WTable，才会被派发。

protocol Animal2 {
    func speak()
}

extension Animal2 {
    func speak() {
        print("test2")
    }
}

class Cat2: Animal2 {}

class PetCat2: Cat2 {
    func speak() {
        print("meow~")
    }
}

let cat2: Animal2 = PetCat2()
cat2.speak() 

let cat22: Cat2 = PetCat2()
cat22.speak()

