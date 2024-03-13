//
//  main.swift
//  0xt03
//
//  Created by naijoug on 2024/3/13.
//

import Foundation

func test() {
    DispatchQueue.main.sync {
        print("1")
    }
}

// 主线程，发生死锁，崩溃
//test()

// 子线程
DispatchQueue.global().async {
    test()
}

sleep(3)
print("Hello, World!")
