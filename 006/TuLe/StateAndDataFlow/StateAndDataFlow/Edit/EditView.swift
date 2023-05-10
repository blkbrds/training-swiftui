//
//  EditView.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 11/04/2023.
//

import SwiftUI

struct EditView: View {

    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var appRouter: StorageData
    @StateObject var viewModel: EditViewModel

    var body: some View {
        VStack {
            TextField(viewModel.user.email, text: $viewModel.user.email)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.orange, lineWidth: 2)
                }
            TextField(viewModel.user.password, text: $viewModel.user.password)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.orange, lineWidth: 2)
                }
            
            Button {
                appRouter.dataLogin = viewModel.saveData()
                dismiss()
            } label: {
                Text("Update")
                    .padding(.horizontal, 25)
                    .padding(.vertical, 10)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .alert(isPresented: $viewModel.isShowAlert) {
                Alert(title: Text("Save Data fail"), message: Text("Tài khoản or mật khẩu không được để trống"), dismissButton: .default(Text("Ok")))
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Edit")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                        Text("Custom Back")
                    }
                }
            }
        }
    }
}
