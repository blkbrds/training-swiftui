//
//  GroupApiView.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 09/06/2023.
//

import SwiftUI

struct GroupApiView: View {

    @StateObject var viewModel = GroupApiViewModel()
    private var gridItem = [GridItem(.flexible(minimum: 140), spacing: 15),
        GridItem(.flexible(minimum: 140), spacing: 15)]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ZStack {
                VStack {
                    Section(header: TextHeaderView(title: "Cocktail Margarita")) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(viewModel.drinks, id: \.idDrink) { drink in
                                    DrinkCell(drink: drink)
                                }
                            }
                                .padding(.horizontal, 20)
                        }
                    }

                    Section(header: TextHeaderView(title: "Dogs")) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: gridItem, spacing: 20) {
                                ForEach(viewModel.dogs, id: \.imageId) { dog in
                                    AnimalCell(animal: dog)
                                        .frame(width: UIScreen.main.bounds.width - 55)
                                }
                            }
                                .padding(.horizontal, 20)
                                .padding(.vertical, 3)
                        }
                    }

                    Section(header: TextHeaderView(title: "Cats")) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: gridItem, spacing: 20) {
                                ForEach(viewModel.cats, id: \.imageId) { cat in
                                    AnimalCell(animal: cat)
                                        .frame(width: UIScreen.main.bounds.width - 55)
                                }
                            }
                                .padding(.horizontal, 20)
                                .padding(.vertical, 3)
                        }
                    }
                }
                    .alert("Failed get data", isPresented: $viewModel.isShowError) { }

                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(3.0)
                }
            }
        }
            .onAppear {
            Task {
                await viewModel.getData()
            }
        }
            .disabled(viewModel.isLoading)
    }
}

struct TextHeaderView: View {

    var title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 30, weight: .medium))
            Spacer()
        }
            .padding(.leading, 20)
    }
}

struct GroupApiView_Previews: PreviewProvider {
    static var previews: some View {
        GroupApiView()
    }
}
