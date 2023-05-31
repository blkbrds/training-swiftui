//
//  SwitchingGridView.swift
//  Grid Layout
//
//  Created by Khuyen Dang T.T. VN.Danang on 30/05/2023.
//

import SwiftUI

struct SwitchingGridView: View {

    @State var aspectRatio: CGFloat = 1.8
    @State var iconButton: String = "square.grid.2x2"
    private var images = ["img0", "img1", "img2", "img3", "img4", "img5", "img6", "img7", "img8", "img9"]
    @State var gridItem: [GridItem] = [GridItem()] {
        didSet {
            switch gridItem.count {
            case 1:
                aspectRatio = 1.8
                iconButton = "square.grid.2x2"
            case 2:
                aspectRatio = 1
                iconButton = "square.grid.3x2"
            case 3:
                aspectRatio = 0.7
                iconButton = "square.grid.4x3.fill"
            default:
                aspectRatio = 1
                iconButton = "rectangle"
            }
        }
    }

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVGrid(columns: gridItem) {
                    ForEach(0...19, id: \.self) {
                        Image(images[$0 % images.count])
                            .resizable()
                            .aspectRatio(aspectRatio, contentMode: .fill)
                            .cornerRadius(5)
                    }
                }
                    .padding(.horizontal, 10)
            }
                .navigationTitle("My Photos")
                .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        gridItem = Array(repeating: GridItem(), count: gridItem.count % 4 + 1)
                    } label: {
                        Image(systemName: iconButton)
                            .font(.title)
                            .foregroundColor(.primary)
                    }

                }
            }
                .animation(.easeInOut, value: gridItem.count)
        }
    }
}

struct SwitchingGridView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchingGridView()
    }
}
