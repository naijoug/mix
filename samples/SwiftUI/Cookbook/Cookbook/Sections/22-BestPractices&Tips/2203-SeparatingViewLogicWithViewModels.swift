//
//  2203-SeparatingViewLogicWithViewModels.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct ContentView_2203_01: View {
  @State private var title = "Hello, World!"

  var body: some View {
    VStack {
      Text(title)
      Button(action: {
        title = "Button was tapped."
      }) {
        Text("Tap me")
      }
    }
  }
}

// MARK: - After Using a View Model

class ContentViewModel: ObservableObject {
  @Published var title = "Hello, World!"

  func buttonTapped() {
    title = "Button was tapped."
  }
}

struct ContentView_2203: View {
  @StateObject var viewModel = ContentViewModel()

  var body: some View {
    VStack {
      Text(viewModel.title)
      Button(action: viewModel.buttonTapped) {
        Text("Tap me")
      }
    }
  }
}
