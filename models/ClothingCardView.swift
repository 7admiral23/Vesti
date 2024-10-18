//
//  ClothingCardView.swift
//  models
//
//  Created by zakariaa belhimer on 16/10/24.
//

import SwiftUI

struct ClothingCardView: View {
    @Binding var item: ClothingItem
    
    var body: some View {
        ZStack (alignment: .topTrailing){
            Image(item.imageName)
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0,maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            if(item.isFavorite) {
                Button {
                    item.isFavorite.toggle()
                } label: {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundColor(.red)
                        .frame(width: 20.0, height: 20.0)
                        .padding([.top, .trailing], 10)
                }
                
                
            }
            else {
                Button {
                    item.isFavorite.toggle()
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .foregroundColor(.red)
                        .frame(width: 20.0, height: 20.0)
                        .padding([.top, .trailing], 10)
                }
            }
        }
        .frame(width: 170.0)
        .padding()
        .shadow(color: Color.black.opacity(0.7), radius: 3, x: 2, y: 2)
    }
}
