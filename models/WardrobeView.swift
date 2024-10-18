//
//  WardrobeView.swift
//  models
//
//  Created by Ulugbek Abdimurodov on 17/10/24.
//

import SwiftUI

struct Wardrobe: Identifiable {
    let id = UUID()
    let height: CGFloat
    let imgString: String
}

struct WardrobeGrid: View {
    
    struct Column: Identifiable {
        let id = UUID()
        var wardrobeItems = [Wardrobe]()
    }
    
    let columns: [Column]
    
    let spacing: CGFloat
    let horizontalPadding: CGFloat
    
    init (wardrobeItems: [Wardrobe], numberOfColumns: Int, spacing: CGFloat = 20, horizontalPadding: CGFloat = 20) {
        self.spacing = spacing
        self.horizontalPadding = horizontalPadding
        
        var columns = [Column]()
        for _ in 0..<numberOfColumns {
            columns.append(Column())
        }
        
        var columnsHeight = Array<CGFloat>(repeating: 0, count: numberOfColumns)
        
        for gridItem in wardrobeItems {
            var smallestColumnIndex = 0
            var smallestHeight = columnsHeight.first!
            for i in 1 ..< columnsHeight.count {
                let curHeight = columnsHeight[i]
                if curHeight < smallestHeight {
                    smallestHeight = curHeight
                    smallestColumnIndex = i
                }
            }
            columns[smallestColumnIndex].wardrobeItems.append(gridItem)
            columnsHeight[smallestColumnIndex] += gridItem.height
        }
        self.columns = columns
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: spacing) {
            ForEach(columns) { column in
                LazyVStack(spacing: spacing) {
                    ForEach(column.wardrobeItems) { gridItem in
                        getItemView(gridItem: gridItem)
                    }
                }
            }
        }
        .padding(.horizontal, horizontalPadding)
    }
    
    func getItemView(gridItem: Wardrobe) -> some View {
        ZStack {
            GeometryReader { reader in
                Image(gridItem.imgString)
                    .resizable()
                    .scaledToFill()
                    .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
            }
        }
        .frame(height: gridItem.height)
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
    }
}

struct WardrobeGrid_Previews: PreviewProvider {
    static var previews: some View {
        HomewView()
    }
}
