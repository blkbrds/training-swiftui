//
//  BasicLayout.swift
//  Grid Layout
//
//  Created by Khuyen Dang T.T. VN.Danang on 22/05/2023.
//

import SwiftUI

struct BasicLayout: View {

    var rows: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I"]
    var columns: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    @State var selectedCell: (String, Int)?

    var body: some View {
        VStack {
            Text("SCREEN")
                .font(.system(size: 25))
                .padding(.bottom, 20)
                .foregroundColor(.cyan)

            ScrollView(.horizontal, showsIndicators: false) {
                VStack {
                    ForEach(rows, id: \.self) { row in
                        HStack {
                            ForEach(columns, id: \.self) { column in
                                ItemView(content: row + String(column), isSelected: changeColor(row: row, column: column))
                                    .onTapGesture {
                                    selectedCell = (row, column)
                                }
                            }
                        }
                    }
                }
                    .padding(.horizontal, 10)
            }
        }
    }

    private func changeColor(row: String, column: Int) -> Bool {
        if let selectedCell = selectedCell, selectedCell.0 == row, selectedCell.1 == column {
            return true
        } else {
            return false
        }
    }
}

struct ItemView: View {
    let content: String
    let isSelected: Bool

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(isSelected ? .gray : .green)
            Text(content)
                .font(.system(size: 22))
                .foregroundColor(.white)
        }
            .frame(width: 60, height: 60)
            .cornerRadius(5)
    }
}

struct BasicLayout_Previews: PreviewProvider {
    static var previews: some View {
        BasicLayout()
    }
}
