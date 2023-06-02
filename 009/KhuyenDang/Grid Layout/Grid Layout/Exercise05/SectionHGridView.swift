//
//  SectionHGridView.swift
//  Grid Layout
//
//  Created by Khuyen Dang T.T. VN.Danang on 30/05/2023.
//

import SwiftUI

struct SectionHGridView: View {

    var gridItem = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]

    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: gridItem, pinnedViews: .sectionHeaders) {
                    Section(header: RotationHeaderView(title: "Section 1")) {
                        ForEach(1...11, id: \.self) { index in
                            ItemOfSectionHGridView(value: "1.\(index)")
                        }
                    }

                    Section(header: RotationHeaderView(title: "Section 2")) {
                        ForEach(1...13, id: \.self) { index in
                            ItemOfSectionHGridView(value: "2.\(index)")
                        }
                    }

                    Section(header: RotationHeaderView(title: "Section 3")) {
                        ForEach(1...15, id: \.self) { index in
                            ItemOfSectionHGridView(value: "3.\(index)")
                        }
                    }
                }
            }
                .padding(.top, 10)
        }
    }
}

struct ItemOfSectionHGridView: View {
    var value: String
    var body: some View {
        Text(value)
            .foregroundColor(.white)
            .frame(minWidth: 50, maxHeight: .infinity)
            .background(randomColor().cornerRadius(10))
    }
}

struct RotationHeaderView: View {
    var title: String
    var body: some View {
        ZStack {
            Color.gray
                .frame(width: 50, height: UIScreen.main.bounds.height - 40)
                .cornerRadius(10)
            Text(title)
                .font(.system(size: 25))
                .rotationEffect(Angle(degrees: -90))
        }
    }
}

struct SectionHGridView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHGridView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
