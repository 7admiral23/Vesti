//
//  HomeView.swift
//  models
//
//  Created by Ulugbek Abdimurodov on 17/10/24.
//

import SwiftUI
import SwiftData

struct HomewView: View {
    @Environment(\.modelContext) var modelContext
    @Query var clothingItemsQuery: [ClothingItem]
    @State private var clothingItems: [ClothingItem]  = []
    @State private var isPresented = false
    @State private var presentedItem: ClothingItem = ClothingItem()
    
    let wardrobeItems = [
        Wardrobe(height: 250, imgString: "outfit1"),
        Wardrobe(height: 150, imgString: "outfit2"),
        Wardrobe(height: 450, imgString: "outfit3"),
        Wardrobe(height: 450, imgString: "outfit4"),
        Wardrobe(height: 450, imgString: "outfit5"),
        Wardrobe(height: 450, imgString: "outfit6"),
        Wardrobe(height: 450, imgString: "outfit7"),
        Wardrobe(height: 450, imgString: "outfit8"),
        Wardrobe(height: 450, imgString: "outfit9"),
        Wardrobe(height: 450, imgString: "outfit10"),
        Wardrobe(height: 450, imgString: "outfit11"),
        Wardrobe(height: 450, imgString: "outfit12"),        
        Wardrobe(height: 450, imgString: "outfit13"),
    ]
    
    @State private var columns = 2
    
    var body: some View {
        NavigationView{
            ScrollView{
                WardrobeGrid(wardrobeItems: wardrobeItems, numberOfColumns: columns, spacing: 20, horizontalPadding: 20)
            }
            .navigationBarTitle("Vesti")
        }
    }
}

struct ContentView_Prewies: PreviewProvider {
    static var previews: some View {
        HomewView()
    }
}
