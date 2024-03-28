//
//  2008-CustomizingPreviews.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct ContentView_2008: View {
  var body: some View {
    Text("Hello, world!")
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background()
  }
}

struct ContentView_2008_Previews: PreviewProvider {
  static var previews: some View {
      ContentView_2008()
          .previewLayout(.fixed(width: 300, height: 70))
          .previewDisplayName("Custom Preview")
          .environment(\.colorScheme, .dark)
      
      ContentView_2008()
          .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
  }
}
