//
//  1005-ImplementADeterminateProgressBar.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct ContentView_1005: View {
  @State private var downloadProgress = 0.0
  @State private var timer: Timer? = nil

  var body: some View {
    VStack {
      ProgressView("Downloading...", value: downloadProgress, total: 100)
        .progressViewStyle(.linear)
      Button("Start Download") {
        simulateDownload()
      }
    }
  }

  func simulateDownload() {
    timer?.invalidate() // Cancel the previous timer if any
    downloadProgress = 0.0 // Reset the progress
    timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
      if downloadProgress < 100 {
        downloadProgress += 1.0
      } else {
        timer.invalidate()
      }
    }
  }
}

