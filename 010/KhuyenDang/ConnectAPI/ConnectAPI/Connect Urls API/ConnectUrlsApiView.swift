//
//  ConnectUrlsApiView.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 07/06/2023.
//

import SwiftUI

struct ConnectUrlsApiView: View {

    @StateObject var viewModel = ConnectUrlsApiViewModel()

    var body: some View {
        ZStack {
            List(viewModel.realAnimals, id: \.imageId) { animal in
                AnimalCell(animal: animal)
                    .listRowSeparator(.hidden)
            }
                .listStyle(.plain)
                .alert(viewModel.errorString, isPresented: $viewModel.isShowError, actions: { })
                .onAppear {
                viewModel.fetchAnimals()
            }
            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(3.0)
            }
        }
            .disabled(viewModel.isLoading)
    }
}

struct ConnectUrlsApiView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectUrlsApiView()
    }
}
