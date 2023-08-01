//
//  AlertModeView.swift
//  SwiftUIDemo
//
//  Created by Khoa Vo T.A. VN.Danang on 19/06/2023.
//

import SwiftUI

struct AlertModeView: View {

    @State private var isAlertPresented: Bool = false
    @State private var isMessagePrinted: Bool = false
    @State private var message: String = ""

    var body: some View {
        Form {
            Section("Input Field") {
                TextField("Message", text: $message)
            }
            Section("Button display alert") {
                Button(action: {
                    isAlertPresented = true
                }) {
                    Text("Tap here")
                }
            }
            Section("Message") {
                if isMessagePrinted {
                    Text("\(message)")
                } else {
                    Text("")
                }
            }
        }
        .alert("Alert Title", isPresented: $isAlertPresented) {
            Button("Close Alert", role: .cancel, action: {
                clearData()
            })
            Button("Submit Message", action: {
                isAlertPresented = false
                isMessagePrinted = true
            })
            Button("Button 2", action: {
                clearData()
            })
        } message: {
            Text("Alert Message")
        }
    }

    private func clearData() {
        isAlertPresented = false
        isMessagePrinted = false
        message = ""
    }
}

struct AlertModeView_Previews: PreviewProvider {
    static var previews: some View {
        AlertModeView()
    }
}
