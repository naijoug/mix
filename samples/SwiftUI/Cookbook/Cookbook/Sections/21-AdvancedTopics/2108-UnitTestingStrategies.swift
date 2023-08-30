//
//  2108-UnitTestingStrategies.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

class CounterViewModel: ObservableObject {
  @Published var count: Int = 0

  func increment() {
    count += 1
  }

  func decrement() {
    count -= 1
  }
}

struct ContentView_2108: View {
  @StateObject var viewModel = CounterViewModel()

  var body: some View {
    VStack {
      Text("Count: \(viewModel.count)")
      Button("Increment", action: viewModel.increment)
      Button("Decrement", action: viewModel.decrement)
    }
  }
}
