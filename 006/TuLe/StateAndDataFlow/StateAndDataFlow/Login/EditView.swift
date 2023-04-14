//
//  EditView.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 11/04/2023.
//

import SwiftUI

struct EditView: View {

    @Binding var dataBinding: User
    @State var data: User
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            TextField(data.email, text: $data.email)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.orange, lineWidth: 2)
                }
            TextField(data.password, text: $data.password)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.orange, lineWidth: 2)
                }
            
            Button {
                dataBinding = User(email: data.email, password: data.password)
                dismiss()
            } label: {
                Text("Update")
                    .padding(.horizontal, 25)
                    .padding(.vertical, 10)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
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
