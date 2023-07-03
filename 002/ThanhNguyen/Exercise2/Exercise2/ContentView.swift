//
//  ContentView.swift
//  Exercise2
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 29/06/2023.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.colorScheme) var colorScheme
    @State var shouldShowingAlert = false
    @Binding var name: String
    public var didAppear: ((Self) -> Void)?

    private let titleColor: Color = Color("titleColor")

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .font(.system(size: 40))
                .imageScale(.large)
                .foregroundColor(titleColor)
                .padding(.bottom, 15)
            Text("Hello, world!")
                .font(.system(size: 25, weight: .heavy, design: .monospaced))
                .foregroundColor(titleColor)
            Text("Light mode always")
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(.brown)
                .font(.system(size: 25, weight: .heavy, design: .monospaced))
                .foregroundColor(titleColor)
                .cornerRadius(.infinity)
                .environment(\.colorScheme, .light)
            Text((name != "") ? name : "---")
                .font(.title)
                .foregroundColor(titleColor)
                .padding()
            Button("Tap me") {
                shouldShowingAlert = true
            }
            .onAppear {
                self.didAppear?(self)
            }
            .alert(isPresented: $shouldShowingAlert, content: {
                Alert(
                    title: .init("Hello Thanh"),
                    message: .init("How are you?"),
                    primaryButton: .cancel(.init("Good")),
                    secondaryButton: .default(.init("Not good"))
                )
            })
            .frame(maxWidth: 100, maxHeight: 40)
            .font(.system(size: 20, weight: .heavy, design: .rounded))
            .padding(10)
            .background(
                LinearGradient(
                    colors: colorScheme == .light ? [.pink, .orange] : [.cyan, .blue],
                    startPoint: .bottomLeading,
                    endPoint: .topTrailing
                )
            )
            .foregroundColor(.white)
            .cornerRadius(.infinity)
            .shadow(color: .pink, radius: 5)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(name: .constant(""))
    }
}
