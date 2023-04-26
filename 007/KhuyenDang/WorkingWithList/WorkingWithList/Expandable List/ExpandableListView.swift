//
//  ExpandableListView.swift
//  WorkingWithList
//
//  Created by Khuyen Dang T.T. VN.Danang on 25/04/2023.
//

import SwiftUI

struct ExpandableListView: View {

    init() {
        let navi = UINavigationBarAppearance()
        navi.backgroundColor = .white
        navi.titleTextAttributes = [.foregroundColor: UIColor.orange,
                .font: UIFont.systemFont(ofSize: 28)]
        UINavigationBar.appearance().standardAppearance = navi
        UINavigationBar.appearance().compactAppearance = navi
//        UINavigationBar.appearance().scrollEdgeAppearance = navi
    }

    @StateObject var viewModel = ExpandableListViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dummyData()) { items in
                    Section(header: MyHeaderView(image: items.dealImage ?? "")) {
                        OutlineGroup(items, children: \.subMenuItems) { item in
                            FoodCell(food: item)
                        }
                    }
                }
            }
                .listStyle(.insetGrouped)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Menu")
                .scrollIndicators(.hidden)
        }
    }
}

struct MyHeaderView: View {

    var image: String

    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .frame(width: .infinity, height: 150)
                .cornerRadius(5)
                .padding(.bottom, 5)
        }
            .padding(.horizontal, -20)
    }
}

struct ExpandableListView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableListView().previewDevice("iPhone 11")
    }
}
