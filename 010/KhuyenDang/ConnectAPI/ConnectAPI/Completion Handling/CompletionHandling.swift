//
//  CompletionHandling.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 01/06/2023.
//

import SwiftUI

struct CompletionHandling: View {

    @StateObject var viewModel = CompletionHandlingViewModel()
    @State var gridItem = [GridItem(.adaptive(minimum: 100), spacing: 10), GridItem(.flexible())]

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: gridItem, spacing: 20) {
                ForEach(viewModel.drinks, id: \.idDrink) { drink in
                    DrinkItem(image: drink.image, name: drink.name)
                }
            }
                .alert(viewModel.errorString, isPresented: $viewModel.isShowError, actions: { })
                .onAppear {
                viewModel.getDrink()
            }
                .padding(.horizontal, 5)
        }
    }
}

struct DrinkItem: View {

    var image: String
    var name: String
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: image)) { image in
                image
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
            } placeholder: {
                Color.gray.opacity(0.05)
                    .aspectRatio(contentMode: .fit)
            }
                .cornerRadius(5)

            Text(name)
                .font(.system(size: 20))
                .lineLimit(1)
                .padding(.leading, 5)
        }
    }
}

struct CompletionHandling_Previews: PreviewProvider {
    static var previews: some View {
        CompletionHandling()
    }
}
