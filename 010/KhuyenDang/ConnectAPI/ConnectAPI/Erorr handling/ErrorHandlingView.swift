//
//  ErrorHandlingView.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 05/06/2023.
//

import SwiftUI

struct ErrorHandlingView: View {

    @StateObject var viewModel = ErrorHandlingViewModel()
    @State var gridItem = [GridItem(.adaptive(minimum: 100), spacing: 10), GridItem(.flexible())]

    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: gridItem, spacing: 20) {
                    ForEach(viewModel.drinks, id: \.idDrink) { drink in
                        DrinkCell(drink: drink)
                    }
                }
                    .alert(viewModel.errorString, isPresented: $viewModel.isShowError, actions: { })
                    .onAppear {
                    viewModel.getDrink()
                }
                    .padding(.horizontal, 5)
            }

            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(3.0)
            }
        }
            .disabled(viewModel.isLoading)
    }
}

struct ErrorHandlingView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorHandlingView()
    }
}
