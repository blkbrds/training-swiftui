//
//  Bai2View.swift
//  HelloSwiftUI
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 10/05/2023.
//

import SwiftUI

struct Bai2View: View {

    // MARK: - Environment
    @Environment (\.colorScheme) var colorScheme

    // MARK: - State
    @State private var isDarkMode = false
    @State private var isShowAlert = false
    @State private var textFieldText = ""

    // MARK: - Properties
    let name: String

    var body: some View {
        VStack {
            Text(textFieldText)
                .padding()
                .foregroundColor(colorScheme == .dark ? .blue : .black)
            Text((name != "") ? name : "---")
                .font(.title)
                .foregroundColor(colorScheme == .dark ? .white : .blue)
                .padding()
            Button {
                handleTapButton()
            } label: {
                Text("Mode")
                    .padding()
            }
                .buttonStyle(MyButtonStyle())
                .alert("Enter name", isPresented: $isShowAlert) {
                TextField("Enter your name", text: $textFieldText)
                Button("Cancel", role: .destructive) {
                }
                Button("OK", role: .cancel) {
                }
            }
        }
            .preferredColorScheme(isDarkMode ? .dark : .light)
    }

    // MARK: - Private func
    private func handleTapButton() {
        isDarkMode.toggle()
        isShowAlert = true
    }
}

struct MyButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .cornerRadius(20)
    }
}

struct Bai2View_Previews: PreviewProvider {
    static var previews: some View {
        Bai2View(name: "Thien Tam")
    }
}
