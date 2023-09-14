//
//  EditView.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 24/08/2023.
//

import SwiftUI

struct EditView: View {

    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: EditViewModel

    var body: some View {
        VStack(spacing: 30) {
            EditProfileView(type: "Nickname", value: $viewModel.nickname)
            EditProfileView(type: "Address", value: $viewModel.address)
            Button {
                viewModel.updateAccountInfo()
                if !viewModel.shouldShowError {
                    presentationMode.wrappedValue.dismiss()
                }
            } label: {
                HomeButton(title: "Done")
            }
        }
        .navigationTitle("Edit Profile")
        .alert(isPresented: $viewModel.shouldShowError) {
            Alert(title: Text("Warning"), message: Text("Your information is empty"))
        }
        .padding()
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(viewModel: .init(profileAccount: .init(id: 0, email: "", password: "", address: "quang nam", nickname: "thanhx18")))
    }
}
