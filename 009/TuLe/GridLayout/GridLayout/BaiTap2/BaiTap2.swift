//
//  BaiTap2.swift
//  GridLayout
//
//  Created by Tu Le C. [2] VN.Danang on 08/06/2023.
//

import SwiftUI

enum TypeImage {
    case sun
    case moon
    case wind
    
    var image: Image {
        switch self {
        case .sun:
            return Image(systemName: "sun.max.fill")
        case .moon:
            return Image(systemName: "moon.fill")
        case .wind:
            return Image(systemName: "wind.snow")
        }
    }
}

struct BaiTap2: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Yêu cầu 1")
                    .font(.title)
                    .bold()
                
                Grid {
                    GridRow {
                        ForEach(1...2, id: \.self) { index in
                            CellContent(image: TypeImage.moon.image, color: .purple)
                        }
                    }
                    GridRow {
                        ForEach(1...2, id: \.self) { index in
                            CellContent(image: TypeImage.moon.image, color: .purple)
                        }
                    }
                }
                
                Text("Yêu cầu 2")
                    .font(.title)
                    .bold()
                
                Grid {
                    GridRow {
                        ForEach(1...2, id: \.self) { index in
                            CellContent(image: TypeImage.moon.image, color: .purple)
                        }
                    }
                    CellContent(image: TypeImage.moon.image, color: .purple)
                }
                
                
                Text("Yêu cầu 3")
                    .font(.title)
                    .bold()
                Grid {
                    GridRow {
                        CellContent(image: TypeImage.sun.image, color: .purple)
                            .gridCellColumns(4)
                        CellContent(image: TypeImage.moon.image, color: .green)
                            .gridCellColumns(5)
                        CellContent(image: TypeImage.sun.image, color: .purple)
                            .gridCellColumns(2)
                        CellContent(image: TypeImage.moon.image, color: .green)
                            .gridCellColumns(2)
                    }
                    CellContent(image: TypeImage.wind.image, color: .orange)
                    GridRow {
                        CellContent(image: TypeImage.sun.image, color: .blue)
                            .gridCellColumns(4)
                        CellContent(image: TypeImage.sun.image, color: .green)
                            .gridCellColumns(9)
                    }
                    CellContent(image: TypeImage.wind.image, color: .purple)
                        .frame(height: 200)
                        .background(.purple)
                        .cornerRadius(8)
                }
                .padding(.horizontal, 5)
            }
        }
    }
}

struct BaiTap2_Previews: PreviewProvider {
    static var previews: some View {
        BaiTap2()
    }
}

struct CellContent: View {

    var image: Image
    var color: Color

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundColor(color)
            .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
            .overlay {
                image
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
            }
    }
}
