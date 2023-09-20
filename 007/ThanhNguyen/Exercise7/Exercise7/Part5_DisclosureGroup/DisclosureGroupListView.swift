//
//  DisclosureGroupListView.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 20/09/2023.
//

import SwiftUI

struct DisclosureGroupListView: View {

    @StateObject var viewModel: DisclosureGroupListViewModel = .init()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            HStack {
                Button("Dismiss") {
                    dismiss.callAsFunction()
                }
                .font(.system(size: 20, weight: .bold))
                Spacer()
            }
            .padding(.horizontal)
            Rectangle()
                .fill(.gray)
                .frame(height: 0.5)
            List {
                ForEach(0..<viewModel.items.count, id: \.self) { index in
                    DisclosureGroup(isExpanded: $viewModel.items[index].isExpanded, content: {
                        Text(viewModel.items[index].answer)
                            .font(.system(size: 17, weight: .regular))
                            .foregroundStyle(.black.opacity(0.8))
                    }, label: {
                        Text("\(index + 1). \(viewModel.items[index].question)")
                            .font(.system(size: 20, weight: .bold))
                    })
                }
            }
            .listStyle(.plain)
            .padding(.top)
            .onDisappear {
                viewModel.saveListQuestion()
            }
        }
    }
}

struct DisclosureGroupListView_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureGroupListView()
    }
}
