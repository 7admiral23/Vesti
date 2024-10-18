//
//  modelsApp.swift
//  models
//
//  Created by zakariaa belhimer on 15/10/24.
//

import SwiftUI
import SwiftData

@main
struct modelsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ClothingItem.self)
    }
}
