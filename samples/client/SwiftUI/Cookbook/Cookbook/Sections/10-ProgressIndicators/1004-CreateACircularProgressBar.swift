//
//  1004-CreateACircularProgressBar.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct ContentView_1004: View {
  @State private var progress: CGFloat = 0.2 // example progress value

  var body: some View {
    VStack {
      CircularProgressView(progress: progress)
        .frame(width: 200, height: 200) // adjust size as needed

      Slider(value: $progress, in: 0...1) // Slider to adjust progress for demonstration
        .padding()
    }
  }
}

struct CircularProgressView: View {
  let progress: CGFloat

  var body: some View {
    ZStack {
      // Background for the progress bar
      Circle()
        .stroke(lineWidth: 20)
        .opacity(0.1)
        .foregroundColor(.blue)

      // Foreground or the actual progress bar
      Circle()
        .trim(from: 0.0, to: min(progress, 1.0))
        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
        .foregroundColor(.blue)
        .rotationEffect(Angle(degrees: 270.0))
        .animation(.linear, value: progress)
    }
  }
}

