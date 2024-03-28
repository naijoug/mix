//
//  0902-CustomizeTabViewAppearance.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct ContentView_0902: View {
  var body: some View {
    TabView {
      Text("First Tab")
        .tabItem {
          Image(systemName: "1.square.fill")
          Text("First")
        }
        .tag(1)

      Text("Second Tab")
        .tabItem {
          Image(systemName: "2.square.fill")
          Text("Second")
        }
        .tag(2)
        .toolbarBackground(.visible, for: .tabBar)
        .toolbarBackground(Color.orange.opacity(0.8), for: .tabBar)

      Text("Third Tab")
        .tabItem {
          Image(systemName: "3.square.fill")
          Text("Third")
        }
        .tag(3)
    }
  }
}

