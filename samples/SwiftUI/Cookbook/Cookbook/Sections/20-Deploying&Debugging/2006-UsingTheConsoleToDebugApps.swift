//
//  2006-UsingTheConsoleToDebugApps.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI
import os

struct ContentView_2006: View {
  @State private var showAlert = false
  let logger = Logger()

  var body: some View {
      VStack {
          Button("Show Alert") {
            logger.info("Button tapped")
            showAlert = true
          }
          .alert(isPresented: $showAlert) {
            Alert(title: Text("Important Message"))
          }
          Button("debug") {
            logger.debug("Button tapped debug")
          }
          Button("trace") {
            logger.trace("Button tapped trace")
          }
          Button("log") {
            logger.log("Button tapped log")
          }
          Button("warning") {
            logger.warning("Button tapped warning")
          }
          Button("error") {
            logger.error("Button tapped error")
          }
      }
  }
}

