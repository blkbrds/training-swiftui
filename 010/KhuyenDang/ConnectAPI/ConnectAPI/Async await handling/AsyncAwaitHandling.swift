//
//  AsyncAwaitHandling.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 02/06/2023.
//

import SwiftUI

struct AsyncAwaitHandling: View {
    @StateObject var viewModel = AsyncAwaitHandlingViewModel()
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
                Task {
                    await viewModel.getDrinksWithAsync()
                }
            }
                .padding(.horizontal, 5)
        }
    }
}

struct AsyncAwaitHandling_Previews: PreviewProvider {
    static var previews: some View {
        AsyncAwaitHandling()
    }
}
