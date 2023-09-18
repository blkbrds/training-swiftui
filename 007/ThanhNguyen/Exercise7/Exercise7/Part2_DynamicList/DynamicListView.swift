//
//  DynamicListView.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 18/09/2023.
//

import SwiftUI

struct DynamicListView: View {

    @StateObject var viewModel: CustomRowsListViewModel = .init()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.persons, id: \.id) { person in
                    PersonCell(person: person)
                        .overlay {
                            NavigationLink {
                                PersonDetail(person: person)
                            } label: {
                                EmptyView()
                            }
                        }
                }
            }
            .navigationTitle("Person List")
        }
    }
}

struct DynamicListView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicListView()
    }
}
