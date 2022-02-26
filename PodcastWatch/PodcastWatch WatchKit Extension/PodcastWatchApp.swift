//
//  PodcastWatchApp.swift
//  PodcastWatch WatchKit Extension
//
//  Created by Abel Demoz on 26/02/2022.
//

import SwiftUI

@main
struct PodcastWatchApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
