//
//  2206-MaintainingState.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct ContentView_2206: View {
  @State private var counter = 0  // Declare a private @State property called counter

  var body: some View {
    VStack {
      Text("Counter: \(counter)")
      Button("Increment") {
        counter += 1  // Increment the counter when the button is tapped
      }
    }
  }
}
