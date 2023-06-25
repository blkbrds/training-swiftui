//
//  EditView.swift
//  StateAndDataFlow
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 23/06/2023.
//

import SwiftUI

struct EditView: View {
    @EnvironmentObject var appRouter: AppRouter
    @ObservedObject var viewModel = EditViewModel()

    var body: some View {
        VStack {
            ZStack {
                Text("Edit")
                    .font(.largeTitle)
                HStack {
                    Image("back")
                        .onTapGesture {
                            appRouter.state = .home
                        }
                    Spacer()
                }
                .padding(.leading, 20)
            }
            
            Text("Please change fullName if you want")
            
            TextField("Change email", text: $viewModel.username)
                .frame(height: 63)
                .padding(.horizontal)
                .background(Color("placeHolder"))
                .cornerRadius(10)
            
            Button(action: {
                viewModel.editFullName()
                appRouter.state = .home
            }) {
                Text(viewModel.titleButton)
                    .foregroundColor(Color("welcome"))
                    .font(.headline)
                    .frame(maxWidth: .infinity, maxHeight: 63)
                    .padding(.horizontal)
                    .background(viewModel.colorButton)
                    .cornerRadius(10)
            }
                .disabled(!viewModel.isLoginButtonEnabled)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
