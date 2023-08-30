//
//  2208-CreatingReusableComponents.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct CustomButton: View {
  let text: String

  var body: some View {
    Button(action: {
      print("\(text) button was tapped")
    }) {
      Text(text)
        .foregroundColor(.white)
        .padding()
        .background(Color.blue)
        .cornerRadius(10)
    }
  }
}

struct ContentView_2208: View {
  var body: some View {
    VStack {
      CustomButton(text: "Sign In")
      CustomButton(text: "Create Account")
    }
  }
}

