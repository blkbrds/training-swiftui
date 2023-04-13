//
//  EditView.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 10/04/2023.
//

import SwiftUI

struct EditView: View {

    @State var previousFullname: String = ""
    @State var previousAddress: String = ""
    @State var previousAge: Int = 0
    @EnvironmentObject var account: Account
    private var localStorage = LocalStorage()
    @Environment(\.presentationMode) var presentationMode
    @State var isShowAlert: Bool = false

    var body: some View {
        VStack(alignment: .center, spacing: 20) {

            MyEditView(type: "FullName", name: $previousFullname)
            MyEditViewNumber(type: "Age", value: $previousAge)
            MyEditView(type: "Address", name: $previousAddress)

            Button(action: {
                if isValidateEdit() {
                    account.setUser(fullname: previousFullname, age: previousAge, address: previousAddress)
                    localStorage.setUser(fullname: previousFullname, age: previousAge, address: previousAddress)
                    presentationMode.wrappedValue.dismiss()
                } else {
                    isShowAlert = true
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
                .alert(isPresented: $isShowAlert) {
                    Alert(title: Text("Edit Failed"), message: Text("Your infomation is invalid"))
                }
            Spacer()
        }
            .navigationTitle("Edit your profile")
            .padding(.top, 100)
            .padding([.leading, .trailing], 25)
            .onAppear {
            previousFullname = account.fullname ?? ""
            previousAddress = account.address ?? ""
            previousAge = account.age ?? 0
        }
    }
    
    private func isValidateEdit() -> Bool {
        return !previousFullname.isEmpty && previousAge != 0 && !previousAddress.isEmpty
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
