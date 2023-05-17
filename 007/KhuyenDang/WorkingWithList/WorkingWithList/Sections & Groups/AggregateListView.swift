//
//  AggregateListView.swift
//  WorkingWithList
//
//  Created by Khuyen Dang T.T. VN.Danang on 25/04/2023.
//

import SwiftUI

struct AggregateListView: View {

    @StateObject private var viewModel = AggregateListViewModel()

    var body: some View {

        List {
            Section(header: MyHeader(content: "FRUITS"), footer: MyFooter(content: viewModel.footerFruits)) {
                ForEach(viewModel.fruits, id: \.self) { fruit in
                    Text(fruit)
                }
            }

            Section(header: MyHeader(content: "VEGETABLES"), footer: MyFooter(content: viewModel.footerVegetables)) {
                ForEach(viewModel.vegetables, id: \.self) { vegetable in
                    Text(vegetable)
                }
            }

            Section(header: MyHeader(content: "ANIMALS"), footer: MyFooter(content: viewModel.footerAnimals)) {
                ForEach(viewModel.animals, id: \.self) { animal in
                    Text(animal)
                }
            }
        }
            .listStyle(.insetGrouped)
            .scrollIndicators(.hidden)
    }
}

struct MyHeader: View {

    var content: String

    var body: some View {
        Text(content)
            .font(.system(size: 20))
    }
}

struct MyFooter: View {

    var content: String

    var body: some View {
        Text(content)
    }
}

struct AggregateList_Previews: PreviewProvider {
    static var previews: some View {
        AggregateListView()
    }
}
