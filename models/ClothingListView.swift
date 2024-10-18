//
//  ClothingListView.swift
//  models
//
//  Created by zakariaa belhimer on 15/10/24.
//

import SwiftUI
import SwiftData

struct ClothingListView: View {
    @Environment(\.modelContext) var modelContext
    @Query var clothingItemsQuery: [ClothingItem]
    @State private var clothingItems: [ClothingItem]  = []
    @State private var isPresented = false
    @State private var presentedItem: ClothingItem = ClothingItem()
    
    let columns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView (showsIndicators: false){
                HStack(alignment: .top, spacing: 5) {
                    VStack {
                        ForEach(clothingItems.indices.prefix((clothingItems.count + 1) / 2), id: \.self) { index in
                            if(clothingItems[index].isFavorite) {
                                Button {
                                    presentedItem = clothingItems[index]
                                    withAnimation {
                                        self.isPresented.toggle()
                                    }
                                } label: {
                                    ClothingCardView(item: $clothingItems[index])
                                }
                            }
                        }
                    }
                    
                    VStack {
                        ForEach(clothingItems.indices.suffix(clothingItems.count / 2), id: \.self) { index in
                            if(clothingItems[index].isFavorite) {
                                Button {
                                    presentedItem = clothingItems[index]
                                    withAnimation {
                                        self.isPresented.toggle()
                                    }
                                } label: {
                                    ClothingCardView(item: $clothingItems[index])
                                }
                            }
                        }
                    }
                }
                .padding(5)
            }
            .navigationBarTitle("Favorites")
            .onAppear {
                clothingItems = clothingItemsQuery
            }
        }
        .fullScreenCover(isPresented: $isPresented) {
            DetailView(item: $presentedItem)
        }
    }
}

struct ClothingItem_Preview: PreviewProvider {
    static var previews: some View {
        ClothingListView()
    }
}
