//
//  2209-UsingViewComposition.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct BlueView: View {
  var body: some View {
    Rectangle()
      .frame(width: 50, height: 50)
      .foregroundColor(.blue) // Creates a blue rectangle
  }
}

struct RedView: View {
  var body: some View {
    Rectangle()
      .frame(width: 50, height: 50)
      .foregroundColor(.red) // Creates a red rectangle
  }
}

struct GreenView: View {
  var body: some View {
    Rectangle()
      .frame(width: 50, height: 50)
      .foregroundColor(.green) // Creates a green rectangle
  }
}

struct ContentView_2209: View {
  var body: some View {
    VStack { // Stacks the views vertically
      BlueView()
      RedView()
      GreenView()
    }
  }
}

