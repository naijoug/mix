//
//  CookbookApp.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

@main
struct CookbookApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
