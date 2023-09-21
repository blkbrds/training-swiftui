//
//  EditingModeView.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 21/09/2023.
//

import SwiftUI

struct EditingModeView: View {

    @StateObject var viewModel: EditingModeViewModel = .init()

    var body: some View {
        NavigationView {
            VStack {
                Rectangle()
                    .fill(.gray)
                    .frame(height: 0.5)
                List(selection: $viewModel.selection) {
                    ForEach(viewModel.heros, id: \.id) { hero in
                        Text(hero.name)
                            .listRowBackground(Color.clear)
                    }
                    .onDelete(perform: viewModel.delete)
                    .onMove(perform: viewModel.move)
                }
                .listStyle(.plain)
            }
            .navigationTitle("ONE PIECE Heros")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    topBarLeadingButton(viewModel.editMode)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                        .fontWeight(.bold)
                }
            }
            .environment(\.editMode, self.$viewModel.editMode)
            .alert("Add new hero", isPresented: $viewModel.shouldShowAddAlert) {
                TextField("Enter hero name", text: $viewModel.heroName)
                Button("OK", action: viewModel.add)
                Button("Cancel", role: .cancel) { }
            }
            .onAppear {
                viewModel.getHeros()
            }
        }
    }

    @ViewBuilder
    private func topBarLeadingButton(_ editMode: EditMode) -> some View {
        switch editMode {
        case .inactive:
            Button(action: {
                viewModel.shouldShowAddAlert.toggle()
            }) {
                Image(systemName: "plus.square.on.square")
            }
        default:
            Button(action: viewModel.deleteSelected) {
                Image(systemName: "trash")
                    .foregroundStyle(.red)
            }
        }
    }
}

struct EditingModeView_Previews: PreviewProvider {
    static var previews: some View {
        EditingModeView()
    }
}
