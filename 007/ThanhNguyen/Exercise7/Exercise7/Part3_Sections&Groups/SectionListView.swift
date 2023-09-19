//
//  SectionListView.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 19/09/2023.
//

import SwiftUI

struct SectionListView: View {

    @StateObject var viewModel: SectionListViewModel = .init()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.charactersData, id: \.id) { data in
                    Section {
                        ForEach(data.name, id: \.self) { name in
                            Text(name)
                                .font(.headline)
                                .padding(.leading)
                        }
                    } header: {
                        HeaderSectionView(title: data.headerTitle)
                    } footer: {
                        FooterSectionView(title: data.footerTitle)
                    }
                    .textCase(nil)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Character list")
        }
    }
}

struct SectionListView_Previews: PreviewProvider {
    static var previews: some View {
        SectionListView()
    }
}
