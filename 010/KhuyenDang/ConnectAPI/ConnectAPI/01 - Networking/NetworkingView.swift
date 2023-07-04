//
//  NetworkingView.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 04/07/2023.
//

import SwiftUI

struct NetworkingView: View {

    @ObservedObject var viewModel: NetworkingViewModel

    var body: some View {
        List(viewModel.drinks, id: \.self) { drink in
            Text(drink)
        }
            .alert(viewModel.errorString, isPresented: $viewModel.isShowError, actions: { })
            .onAppear {
            viewModel.fetchDrinks()
        }
    }
}

struct NetworkingView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkingView(viewModel: NetworkingViewModel())
    }
}
