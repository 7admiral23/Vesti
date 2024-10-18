//
//  DetailView.swift
//  models
//
//  Created by zakariaa belhimer on 16/10/24.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var item: ClothingItem
    var body: some View {
        ScrollView {
            VStack {
                ZStack (alignment: .topLeading){
                    Image(item.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width)
                        .cornerRadius(40)
                    
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .padding(40)
                            .tint(.white)
                            .font(.system(size: 30))
                    }
                }
                
                HStack {
                    Text(item.name)
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    if(item.isFavorite) {
                        Button {
                            item.isFavorite.toggle()
                        } label: {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(width: 22.0, height: 22.0)
                        }
                    }
                    else {
                        Button {
                            item.isFavorite.toggle()
                        } label: {
                            Image(systemName: "heart")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(width: 22.0, height: 22.0)
                        }
                    }
                    
                }
                
                .padding()
                .cornerRadius(20)
                VStack (alignment: .leading){
                    HStack {
                        Text("Type:")
                            .bold()
                        Text("Felpa")
                    }
                    Divider()
                    HStack {
                        Text("Marca:")
                            .bold()
                        Text("Prada")
                    }
                    Divider()
                    HStack {
                        Text("Stagione:")
                            .bold()
                        Text("Inverno")
                    }
                    Divider()
                }
                Spacer()
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}
