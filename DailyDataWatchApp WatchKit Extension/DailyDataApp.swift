//
//  DailyDataApp.swift
//  DailyDataWatchApp WatchKit Extension
//
//  Created by Fede Duarte on 6/4/22.
//

import SwiftUI

@main
struct DailyDataApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
