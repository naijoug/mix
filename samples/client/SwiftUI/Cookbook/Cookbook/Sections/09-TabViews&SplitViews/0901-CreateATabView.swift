//
//  0901-CreateATabView.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct ContentView_0901: View {
  var body: some View {
    TabView {
      Text("Tab 1's a star!")
        .tabItem {
          Image(systemName: "star")
          Text("Tab 1")
        }.tag(1)

      Text("Show the love for Tab 2!")
        .tabItem {
          Image(systemName: "heart")
          Text("Tab 2")
        }.tag(2)
    }
  }
}

