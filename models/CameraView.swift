//
//  CameraView.swift
//  models
//
//  Created by Ulugbek Abdimurodov on 17/10/24.
//

import SwiftUI

struct CameraView: View {
    @State private var showActionSheet = false
    
    var body: some View {
        VStack {
            Text("Upload your photo!")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                showActionSheet = true
            }) {
                Text("Add new photo")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(title: Text("Choose an Option"),
                        message: Text("Please select one of the following actions."),
                        buttons: [
                            .default(Text("Camera")) {
                                // Action for Option 1
                                print("Camera selected")
                            },
                            .default(Text("Photos")) {
                                // Action for Option 2
                                print("photoes selected")
                            },
                            .destructive(Text("Delete")) {
                                // Action for Delete
                                print("Delete selected")
                            },
                            .cancel() // Adds a Cancel button
                        ])
        }
    }
}

#Preview {
    CameraView()
}
