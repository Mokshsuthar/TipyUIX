//
//  TipyUIX_swiftuiApp.swift
//  TipyUIX_swiftui
//
//  Created by John kim on 7/22/25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import SwiftUI

@main
struct TipyUIX_swiftuiApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
