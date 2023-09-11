
// Reference: [2021-08-06 为什么Swift说自己是安全的？](https://juejin.cn/post/6993238432436715551)

import Foundation

func unsafe() {
    print("unsafe...")
    var value: CGPoint = .zero
    for _ in 0..<2000 {
        DispatchQueue.global().async {
            let old = value
            value.x += 1
            value.y += 1
            print(old, value)
            if old != CGPoint(x: value.x - 1, y: value.y - 1) {
                assertionFailure("")
            }
        }
    }
}
// unsafe()

func fixUnsafe() {
    print("fix unsafe...")
    let value: CGPoint = .zero
    for _ in 0..<2000 {
        DispatchQueue.global().async { [value] in
            var value = value
            let old = value
            value.x += 1
            value.y += 1
            print(old, value)
            if old != CGPoint(x: value.x - 1, y: value.y - 1) {
                assertionFailure("")
            }
        }
    }
}
fixUnsafe()