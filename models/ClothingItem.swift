//
//  ClothingItem.swift
//  models
//
//  Created by zakariaa belhimer on 15/10/24.
//
import Foundation
import SwiftData

@Model
class ClothingItem: Identifiable{
    var id = UUID()
    var name: String
    var imageName: String
    var isFavorite: Bool

    init(name: String = "", imageName: String = "", isFavorite: Bool = false) {
        self.id = UUID()
        self.name = name
        self.imageName = imageName
        self.isFavorite = isFavorite
    }
}


