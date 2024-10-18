//
//  ContentView.swift
//  models
//
//  Created by Ulugbek Abdimurodov on 17/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomewView()
            }
            Tab("Favourites", systemImage: "heart.fill") {
                ClothingListView()
            }
            Tab("Camera", systemImage: "camera") {
                CameraView()
            }
        }
        .navigationBarTitle("Vesti")
    }
}

#Preview {
    ContentView()
}
