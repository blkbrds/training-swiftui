//
//  BaiTap6.swift
//  GridLayout
//
//  Created by Tu Le C. [2] VN.Danang on 12/06/2023.
//

import SwiftUI

struct BaiTap6: View {

    @State var gridLayout: [GridItem] = [ GridItem() ] {
        didSet {
            switch gridLayout.count {
            case 1:
                icon = "rectangle.grid.2x2"
            case 2:
                icon = "rectangle.grid.3x2"
            case 3:
                icon = "square.grid.4x3.fill"
            case 4:
                icon = "rectangle.grid.1x2"
            default:
                icon = "rectangle.grid.1x2"
            }
        }
    }
    @State var icon: String = "rectangle.grid.2x2"
    let samplePhotos = (1...7).map { Photo(name: "dragonBall\($0)") }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    
                    ForEach(samplePhotos.indices, id: \.self) { index in
                        
                        Image(samplePhotos[index].name)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: gridLayout.count == 1 ? 200 : 100)
                            .cornerRadius(10)
                            .shadow(color: Color.primary.opacity(0.3), radius: 1)
                        
                    }
                }
                .padding(.all, 10)
                .animation(.interactiveSpring(), value: gridLayout.count)
            }
            .navigationTitle("DragonBall super")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.gridLayout = Array(repeating: .init(.flexible()), count: self.gridLayout.count % 4 + 1)
                    } label: {
                        Image(systemName: icon)
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}

struct BaiTap6_Previews: PreviewProvider {
    static var previews: some View {
        BaiTap6()
    }
}

struct Photo: Identifiable {
    var id = UUID()
    var name: String
}
