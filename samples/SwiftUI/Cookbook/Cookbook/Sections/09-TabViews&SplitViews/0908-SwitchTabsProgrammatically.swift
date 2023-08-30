//
//  0908-SwitchTabsProgrammatically.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct ContentView_0908: View {
  @State private var selectedTab: Int = 0

  var body: some View {
    VStack {
      Button("Switch to second tab") {
        selectedTab = 1
      }
      .padding()

      TabView(selection: $selectedTab) {
        Text("First Tab")
          .tabItem {
            Image(systemName: "1.circle")
            Text("Tab 1")
          }
          .tag(0)

        Text("Second Tab")
          .tabItem {
            Image(systemName: "2.circle")
            Text("Tab 2")
          }
          .tag(1)
      }
    }
  }
}

