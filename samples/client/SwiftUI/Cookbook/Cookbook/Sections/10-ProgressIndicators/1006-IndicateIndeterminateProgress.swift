//
//  1006-IndicateIndeterminateProgress.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct ContentView_1006: View {
  var body: some View {
    IndeterminateProgressView()
  }
}

struct IndeterminateProgressView: View {
  @State private var isLoading = true

  var body: some View {
    VStack {
      ProgressView("Loading…")
        .progressViewStyle(.circular)
        .scaleEffect(2.0, anchor: .center) // Optional: make it bigger
    }
    .onAppear {
      startAnimating()
    }
  }

  func startAnimating() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      withAnimation(Animation.linear(duration: 1.5).repeatForever()) {
        isLoading = true
      }
    }
  }
}

