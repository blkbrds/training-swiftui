//
//  SettingView.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 20/04/2023.
//

import SwiftUI

struct SettingView: View {

    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: SettingViewModel
    @EnvironmentObject var appRouter: StorageData

    var body: some View {
        VStack(spacing: 15) {
            Text("User Setting")
                .font(.system(size: 15, weight: .bold))
            HStack {
                Text("Email:")
                TextField("", text: $viewModel.user.email)
                    .textFieldStyle(.roundedBorder)
                Spacer()
            }
            
            HStack {
                Text("Password:")
                TextField("", text: $viewModel.user.password)
                    .textFieldStyle(.roundedBorder)
                Spacer()
            }
            
            HStack {
                Text("Nortify")
                Toggle("Nortify", isOn: $viewModel.isNortify)
                    .labelsHidden()
                Spacer()
            }
            
            HStack {
                Text("DarkMode")
                Toggle("DarkMode", isOn: $viewModel.isDarkMode)
                    .labelsHidden()
                Spacer()
            }
            
            Button {
                guard let data = viewModel.saveData() else { return }
                appRouter.isDarkMode = viewModel.isDarkMode
                appRouter.nortify = viewModel.isNortify
                appRouter.dataLogin = data
                dismiss()
            } label: {
                Text("Lưu")
                    .padding(.horizontal, 7)
            }
            .buttonStyle(.borderedProminent)
            .alert(isPresented: $viewModel.isShowAlert) {
                Alert(title: Text("Save Data fail"), message: Text("Tài khoản or mật khẩu không được để trống"), dismissButton: .default(Text("Ok")))
            }

        }
        .padding()
    }
}
