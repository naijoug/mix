//
//  0909-HideATabView.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct ContentView_0909: View {
  @State private var isTabViewHidden = false

  var body: some View {
    VStack {
      Button(action: {
        isTabViewHidden.toggle()
      }) {
        Text(isTabViewHidden ? "Show Tab View" : "Hide Tab View")
      }
      .padding()

      if !isTabViewHidden {
        TabView {
          Text("First View")
            .tabItem {
              Image(systemName: "1.circle")
              Text("First")
            }

          Text("Second View")
            .tabItem {
              Image(systemName: "2.circle")
              Text("Second")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      }
    }
  }
}

