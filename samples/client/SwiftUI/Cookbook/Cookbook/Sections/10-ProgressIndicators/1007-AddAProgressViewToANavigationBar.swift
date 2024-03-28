//
//  1007-AddAProgressViewToANavigationBar.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct ContentView_1007: View {
  var body: some View {
    NavigationStack {
      VStack {
        Text("Hello, World!")
      }
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          ProgressView()
        }
      }
    }
  }
}

