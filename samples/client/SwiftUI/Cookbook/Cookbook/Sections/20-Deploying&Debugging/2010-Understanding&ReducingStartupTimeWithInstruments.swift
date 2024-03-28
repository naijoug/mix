//
//  2010-Understanding&ReducingStartupTimeWithInstruments.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

      //AnalyticsService.shared.longStartupTime()
      DispatchQueue.global().async {
          AnalyticsService.shared.longStartupTime()
      }

    return true
  }
}

class AnalyticsService {
  static let shared = AnalyticsService()
  private init() {}

  func longStartupTime() {
      print("\(Date()) starting...")
      sleep(10)
      print("\(Date()) stated.")
  }
}

struct ContentView_2010: View {
  var body: some View {
    Text("Hello world!")
  }
}

