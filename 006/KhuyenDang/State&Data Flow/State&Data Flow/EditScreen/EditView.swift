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

    var body: some View {
        VStack(alignment: .center, spacing: 20) {

            MyEditView(type: "FullName", name: $account.fullname.toUnwrapped(defaultValue: ""))
            MyEditViewNumber(type: "Age", value: $account.age.toUnwrapped(defaultValue: 0))
            MyEditView(type: "Address", name: $account.address.toUnwrapped(defaultValue: ""))

            Button(action: {
                account.fullname = previousFullname
                account.address = previousAddress
                account.age = previousAge
            }
                , label: {
                    Text("Cancel")
                        .padding([.top, .bottom], 10)
                        .frame(width: UIScreen.main.bounds.width - 100)
                })
                .font(.system(size: 24))
                .foregroundColor(Color("bearColor"))
                .cornerRadius(20)
                .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(red: 0.683, green: 0.597, blue: 0.501), lineWidth: 1)
            )
                .padding(.top, 50)
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
}

struct MyEditView: View {

    var type: String
    @Binding var name: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(type)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.brown)
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField(name, text: $name)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                .font(.system(size: 20))
                .overlay(
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.brown)
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
                .foregroundColor(.brown)
                .frame(maxWidth: .infinity, alignment: .leading)

            TextField("\(value)", value: $value, formatter: NumberFormatter())
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                .font(.system(size: 20))
                .overlay(
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.brown)
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
