//
//  EditView.swift
//  State&Data Flow
//
//  Created by Khuyen Dang T.T. VN.Danang on 10/04/2023.
//

import SwiftUI

struct EditView: View {

    @Binding var fullname: String
    @Binding var address: String
    @Binding var age: Int
    @State var previousFullname: String = ""
    @State var previousAddress: String = ""
    @State var previousAge: Int = 0

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            MyEditView(type: "FullName", name: $fullname)
            MyEditViewNumber(type: "Age", value: $age)
            MyEditView(type: "Address", name: $address)

            Button(action: {
                fullname = previousFullname
                address = previousAddress
                age = previousAge
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
            previousFullname = fullname
            previousAddress = address
            previousAge = age
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
            TextField(type, value: $value, formatter: NumberFormatter())
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


