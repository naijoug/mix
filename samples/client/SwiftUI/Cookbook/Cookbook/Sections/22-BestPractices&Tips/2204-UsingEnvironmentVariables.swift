//
//  2204-UsingEnvironmentVariables.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct ContentView_2204_01: View {
  @Environment(\.layoutDirection) var layoutDirection
  
  var body: some View {
    if layoutDirection == .leftToRight {
      Text("Left to Right layout")
    } else {
      Text("Right to Left layout")
    }
  }
}

struct ContentView_2204: View {
  var body: some View {
    VStack {
      Text("This is a title in a child view with multiple lines")
        .font(.title)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.green)
        .foregroundColor(.white)
      
      Divider()
      
      VStack {
        Text("This is a title in a child view with multiple lines")
          .font(.headline)
          .frame(maxWidth: .infinity)
          .padding()
          .background(Color.blue)
          .foregroundColor(.white)
      }
      .environment(\.layoutDirection, .rightToLeft)
    }
  }
}
