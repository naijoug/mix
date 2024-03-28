//
//  2207-DebuggingViews.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct ContentView_2207: View {
  @State private var count = 0

  var body: some View {
    Button("Tap Me") {
      count += 1
      print("Button tapped \(count) times.")

      if count > 10 {
        assertionFailure("Button was tapped too many times!")
      }
    }
  }
}

