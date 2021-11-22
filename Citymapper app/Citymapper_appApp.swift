//
//  Citymapper_appApp.swift
//  Citymapper app
//
//  Created by Luke Davis on 20/11/2021.
//

import SwiftUI

@main
struct CitymapperApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
