//
//  EditView.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 10/04/2023.
//

import SwiftUI

struct EditView: View {

    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: EditViewModel

    var body: some View {
        VStack(alignment: .center, spacing: 20) {

            MyEditView(type: "FullName", name: $viewModel.previousFullname)
            MyEditViewNumber(type: "Age", value: $viewModel.previousAge)
            MyEditView(type: "Address", name: $viewModel.previousAddress)

            Button(action: {
                viewModel.handleEditProfile()
                if !viewModel.isShowAlert {
                    presentationMode.wrappedValue.dismiss()
                }
            }
                , label: {
                    Text("Done")
                        .padding([.top, .bottom], 10)
                        .frame(width: UIScreen.main.bounds.width - 100)
                })
                .font(.system(size: 24))
                .foregroundColor(Color("primaryColor"))
                .cornerRadius(20)
                .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("primaryColor50%"), lineWidth: 1)
            )
                .padding(.top, 50)
                .alert(isPresented: $viewModel.isShowAlert) {
                Alert(title: Text("Edit Failed"), message: Text("Your infomation is invalid"))
            }
            Spacer()
        }
            .navigationTitle("Edit your profile")
            .padding(.top, 100)
            .padding([.leading, .trailing], 25)
    }
}

struct MyEditView: View {

    var type: String
    @Binding var name: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(type)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color("primaryColor50%"))
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField(name, text: $name)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                .font(.system(size: 20))
                .overlay(
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(Color("primaryColor50%"))
                    .offset(y: 15)
            )
                .padding(.top, -8)
        }
    }
}

struct MyEditViewNumber: View {

    var type: String
    @Binding var value: Int

    var body: some View {
        VStack(alignment: .leading) {
            Text(type)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color("primaryColor50%"))
                .frame(maxWidth: .infinity, alignment: .leading)

            TextField("\(value)", value: $value, formatter: NumberFormatter())
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                .font(.system(size: 20))
                .overlay(
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(Color("primaryColor50%"))
                    .offset(y: 15)
            )
                .padding(.top, -8)
        }
    }
}

extension Binding {
    func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T> {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
