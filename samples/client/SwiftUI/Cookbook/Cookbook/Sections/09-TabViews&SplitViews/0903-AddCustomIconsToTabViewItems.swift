//
//  0903-AddCustomIconsToTabViewItems.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct ContentView_0903: View {
  var body: some View {
    TabView {
      Text("Here comes the sun 🎶 !")
        .tabItem {
          Image("HappySun")
          Text("Sun")
        }
      Text("I see a good moon rising 🎶 !")
        .tabItem {
          Image("HappyMoon")
          Text("Moon")
        }
    }
  }
}

