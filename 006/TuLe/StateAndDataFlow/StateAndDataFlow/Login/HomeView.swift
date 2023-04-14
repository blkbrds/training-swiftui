//
//  HomeView.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 11/04/2023.
//

import SwiftUI

struct HomeView: View {

    @State var data: User
    @EnvironmentObject var appRouter: StorageData

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text(data.email)
                Text(data.password)
                NavigationLink {
                    EditView(dataBinding: $data, data: data)
                } label: {
                    Text("Edit")
                        .padding(.horizontal, 25)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button {
                    appRouter.dataLogin = nil
                    appRouter.appState = .login
                } label: {
                    Text("Log out")
                        .padding(.horizontal, 25)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

            }
            .navigationTitle("HomeScreen")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(data: User(email: "123", password: "456"))
    }
}
