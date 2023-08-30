//
//  1002-CreateASpinningActivityIndicator.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct SpinnerView: View {
  var body: some View {
    ProgressView()
      .progressViewStyle(CircularProgressViewStyle(tint: .blue))
      .scaleEffect(2.0, anchor: .center) // Makes the spinner larger
      .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
          // Simulates a delay in content loading
          // Perform transition to the next view here
        }
      }
  }
}

struct ContentView_1002: View {
  var body: some View {
    SpinnerView()
  }
}

