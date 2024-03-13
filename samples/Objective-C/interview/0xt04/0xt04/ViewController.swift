//
//  ViewController.swift
//  0xt04
//
//  Created by naijoug on 2024/3/13.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        test()
    }
    
    func test() {
        print("1")
        let queue = DispatchQueue.init(label: "thread")
        queue.async {
            print("2")
            DispatchQueue.main.sync {
                print("3")
                queue.sync {
                    print("4")
                }
            }
            print("5")
        }
        print("6")
        queue.async {
            print("7")
        }
        print("8")
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

