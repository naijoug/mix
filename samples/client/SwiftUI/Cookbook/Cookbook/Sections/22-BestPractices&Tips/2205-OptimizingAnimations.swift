//
//  2205-OptimizingAnimations.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct ContentView_2205_01: View {
  @State private var scale = 1.0

  var body: some View {
    Circle()
      .fill(Color.blue)
      .frame(width: 100 * scale, height: 100 * scale)
      .scaleEffect(scale)
      .onTapGesture {
        scale += 0.5
      }
      .animation(.spring(), value: scale) // implicit animation
  }
}

// MARK: - Explicit animations with withAnimation

struct ContentView_2205: View {
  @State private var scale = 1.0

  var body: some View {
    Circle()
      .fill(Color.blue)
      .frame(width: 100 * scale, height: 100 * scale)
      .scaleEffect(scale)
      .onTapGesture {
        withAnimation(.spring()) { // explicit animation
          scale += 0.5
        }
      }
  }
}

