//
//  2009-FindingMemoryLeaksUsingInstruments.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

class LeakyClass {
  var handler: (() -> Void)?
  let value: Int

  init(value: Int) {
    self.value = value
    handler = {
      self.doSomething()
    }
  }

  func doSomething() {
    print("Doing something...")
  }

  deinit {
    print("LeakyClass deinitialized")
  }
}

struct ContentView_2009: View {
  @State private var isDetailViewShowing = false

  var body: some View {
    VStack {
      Button("Go to Detail View") {
        isDetailViewShowing = true
      }
      .sheet(isPresented: $isDetailViewShowing, content: {
        DetailView(leakyClass: LeakyClass(value: Int.random(in: 0..<1000)))
      })
    }
  }
}

struct DetailView: View {
  let leakyClass: LeakyClass

  var body: some View {
    Text("Detail View: \(leakyClass.value)")
      .onDisappear {
        leakyClass.handler?()
      }
  }
}

