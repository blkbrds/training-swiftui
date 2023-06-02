//
//  SectionVGridView.swift
//  Grid Layout
//
//  Created by Khuyen Dang T.T. VN.Danang on 29/05/2023.
//

import SwiftUI

struct SectionVGridView: View {

    var gridItem = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: gridItem, pinnedViews: .sectionHeaders) {
                    Section(header: HeaderView(title: "Section 1")) {
                        ForEach(1...11, id: \.self) { index in
                            ItemOfSectionVGridView(value: "1.\(index)")
                        }
                    }

                    Section(header: HeaderView(title: "Section 2")) {
                        ForEach(1...13, id: \.self) { index in
                            ItemOfSectionVGridView(value: "2.\(index)")
                        }
                    }

                    Section(header: HeaderView(title: "Section 3")) {
                        ForEach(1...15, id: \.self) { index in
                            ItemOfSectionVGridView(value: "3.\(index)")
                        }
                    }
                }
            }
                .toolbar(.visible, for: .navigationBar)
                .padding(.horizontal, 10)
        }
    }
}

func randomColor() -> Color {
    let red = Double.random(in: 0...1)
    let green = Double.random(in: 0...1)
    let blue = Double.random(in: 0...1)
    return Color(red: red, green: green, blue: blue)
}

struct ItemOfSectionVGridView: View {
    var value: String
    var body: some View {
        Text(value)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(randomColor().cornerRadius(10))
    }
}

struct HeaderView: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.system(size: 25))
            .frame(width: UIScreen.main.bounds.width - 40, height: 50)
            .background(.gray)
            .cornerRadius(10)
            .padding(.bottom, 10)
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionVGridView()
    }
}
