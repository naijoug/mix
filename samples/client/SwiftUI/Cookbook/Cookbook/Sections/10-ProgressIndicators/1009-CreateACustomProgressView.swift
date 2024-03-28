//
//  1009-CreateACustomProgressView.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct CustomProgressView: View {
  let progress: CGFloat

  var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .leading) {
        Rectangle()
          .frame(width: geometry.size.width, height: 10)
          .opacity(0.3)
          .foregroundColor(.gray)

        Rectangle()
          .frame(
            width: min(progress * geometry.size.width,
                       geometry.size.width),
            height: 10
          )
          .foregroundColor(.blue)
      }
    }
  }
}

struct ContentView_1009: View {
  @State var progress: CGFloat = 0.5

  var body: some View {
    VStack {
      CustomProgressView(progress: progress)
        .frame(height: 10)
        .padding(.horizontal, 50)

      Button(action: {
        progress += 0.1
      }) {
        Text("Increase Progress")
      }
    }
  }
}
