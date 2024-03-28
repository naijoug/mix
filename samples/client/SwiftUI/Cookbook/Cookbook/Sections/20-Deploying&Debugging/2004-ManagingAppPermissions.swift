//
//  2004-ManagingAppPermissions.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI
import Photos

struct ContentView_2004: View {
  var body: some View {
    Button("Request Photo Library Permission") {
      requestPhotoLibraryAccess()
    }
  }

  private func requestPhotoLibraryAccess() {
    let status = PHPhotoLibrary.authorizationStatus()

    switch status {
    case .notDetermined:
      PHPhotoLibrary.requestAuthorization { newStatus in
        if newStatus == .authorized {
          print("Access granted.")
        } else {
          print("Access denied.")
        }
      }
    case .restricted, .denied:
      print("Access denied or restricted.")
    case .authorized:
      print("Access already granted.")
    case .limited:
      print("Access limited.")
    @unknown default:
      print("Unknown authorization status.")
    }
  }
}

