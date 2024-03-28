//
//  0103-UseXcodePreviews.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct ContentView_0103: View {
  var body: some View {
    VStack {
      Text("Hello, SwiftUI!")
        .padding()
      Button(action: {
        print("Button tapped!")
      }) {
        Text("Tap me!")
      }
    }
  }
}

struct ContentView_0103_Previews: PreviewProvider {
  static var previews: some View {
    ContentView_0103()
      .previewDevice("iPhone 14 Pro")
  }
}

