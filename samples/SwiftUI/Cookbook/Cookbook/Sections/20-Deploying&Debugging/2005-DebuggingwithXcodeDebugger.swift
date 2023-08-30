//
//  2005-DebuggingwithXcodeDebugger.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct ContentView_2005: View {
  @State private var counter = 0

  var body: some View {
    VStack {
      Text("Here's the count: \(counter)")
        .padding()
      Button("Increase Counter") {
        counter += 1
      }
    }
  }
}

