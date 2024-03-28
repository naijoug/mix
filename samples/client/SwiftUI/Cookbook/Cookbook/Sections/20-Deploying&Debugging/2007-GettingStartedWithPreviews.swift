//
//  2007-GettingStartedWithPreviews.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct ContentView_2007: View {
  var message: String = "Hello, world!"

  var body: some View {
    Text(message)
  }
}

struct ContentView_2007_Previews: PreviewProvider {
  static var previews: some View {
      ContentView_2007(message: "Hello, world!")
      .previewDisplayName("Saying hi")

      ContentView_2007(message: "Goodbye, world!")
      .previewDisplayName("Saying bye")
  }
}
