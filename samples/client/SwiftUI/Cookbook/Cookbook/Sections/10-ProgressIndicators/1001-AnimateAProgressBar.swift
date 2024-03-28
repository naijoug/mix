//
//  1001-AnimateAProgressBar.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI
import Combine

struct ContentView_1001: View {
  @State private var progress: CGFloat = 0.0

  let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

  var body: some View {
    ZStack(alignment: .leading) {
      Rectangle()
        .frame(width: 300, height: 20)
        .opacity(0.3)
        .foregroundColor(.gray)

      Rectangle()
        .frame(width: progress * 300, height: 20)
        .foregroundColor(.green)
        .animation(.easeInOut, value: progress)
    }
    .onReceive(timer) { _ in
      if progress < 1.0 {
        progress += 0.01
      }
    }
  }
}
