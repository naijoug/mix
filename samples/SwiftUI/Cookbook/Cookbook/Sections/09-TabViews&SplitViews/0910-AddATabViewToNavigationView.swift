//
//  0910-AddATabViewToNavigationView.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct ContentView_0910: View {
  var body: some View {
    NavigationStack {
      TabView {
        Text("First Tab")
          .tabItem {
            Image(systemName: "house")
            Text("Home")
          }
        
        Text("Second Tab")
          .tabItem {
            Image(systemName: "person")
            Text("Profile")
          }
      }
      .navigationTitle("My App")
    }
  }
}

