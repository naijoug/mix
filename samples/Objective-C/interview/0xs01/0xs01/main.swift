//
//  main.swift
//  0xs01
//
//  Created by naijoug on 2024/3/13.
//

import Foundation

@propertyWrapper
struct Wrapper<T> {
    var wrappedValue: T

    var projectedValue: Wrapper<T> { return self }

    func foo() { print("Foo") }
}
struct HasWrapper {
    @Wrapper var x = 0
    
    func foo() {
        print(x) // wrappedValue
        print(_x) // wrapper type itself
        print($x) // projectedValue
    }
}

HasWrapper().foo()
