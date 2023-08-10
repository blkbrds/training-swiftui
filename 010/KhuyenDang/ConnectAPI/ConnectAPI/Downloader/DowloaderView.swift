//
//  DowloaderView.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 14/06/2023.
//

import SwiftUI

struct DowloaderView: View {

    @StateObject var viewModel = DownloaderViewModel()

    var body: some View {
        List(viewModel.beachs, id: \.id) { beach in
            PixabayCell(item: beach)
                .listRowSeparator(.hidden)
        }
            .listStyle(.plain)
            .onAppear {
            viewModel.getBeachPixabay()
        }
    }
}

struct DowloaderView_Previews: PreviewProvider {
    static var previews: some View {
        DowloaderView()
    }
}
