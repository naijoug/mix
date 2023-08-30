//
//  CookbookUITests.swift
//  CookbookUITests
//
//  Created by guojian on 2023/8/30.
//

import XCTest

final class CookbookUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

import SwiftUI
import ViewInspector
//@testable import ToDoListApp

class ContentViewTests: XCTestCase {

  func testAddingItem() throws {
    let viewModel = ToDoListViewModel()
    viewModel.addItem("Buy milk")
    let view = ContentView_2109(viewModel: viewModel)
    let list = try view.inspect().navigationStack().list()
    XCTAssertEqual(list.count, 1)
    let rowOneText = try list.forEach(0).hStack(0).text(0)

    XCTAssertEqual(try rowOneText.string(), "Buy milk")
  }

  func testItemCompletion() throws {
    let viewModel = ToDoListViewModel()
    viewModel.addItem("Walk the dog")
    let view = ContentView_2109(viewModel: viewModel)
    viewModel.toggleCompletion(for: viewModel.items.first!)

    let rowOne = try view.inspect().navigationStack().list().forEach(0).hStack(0)

    XCTAssertTrue(viewModel.items.first!.isCompleted)
    XCTAssertEqual(try rowOne.image(2).actualImage(), Image(systemName: "checkmark"))
  }
}
