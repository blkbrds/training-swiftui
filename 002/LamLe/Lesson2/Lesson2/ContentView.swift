//
//  ContentView.swift
//  Lesson2
//
//  Created by Lam Le T. [2] VN.Danang on 6/30/23.
//

import SwiftUI

struct ContentView: View {
    
    let name: String
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State var isShowAlert = false
    @State var textInfo: String = ""
    @State var infoShow: String = ""
    internal var didAppear: ((Self) -> Void)?
    
    
    var body: some View {
        VStack {
            Text("Hello, SwiftUI Lesson 2")
                .font(.system(size: 20, weight: .light, design: .serif))
                .padding()
                .background(colorScheme == .dark ? .gray : .white)
                .cornerRadius(20)
            Text("Hello Again, SwiftUI Lesson 2")
                .font(.system(size: 20, weight: .ultraLight, design: .serif))
                .padding()
                .foregroundColor(colorScheme == .dark ? .blue : .green)
                .environment(\.colorScheme, .light)
            Text((name != "") ? name : "---")
                .font(.title)
                .foregroundColor(Color.blue)
                .padding()
            VStack {
                Button("Tap Me Enter Info") {
                    isShowAlert = true
                }
                .font(.system(size: 28, weight: .bold, design: .serif))
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(10)
                .background(LinearGradient(colors: [.gray, .blue.opacity(0.7)], startPoint: .topTrailing, endPoint: .bottomLeading))
                .cornerRadius(20)
                .shadow(color: .white, radius: 4)
                .onAppear { self.didAppear?(self) }
                .alert("Enter Your Name", isPresented: $isShowAlert) {
                    TextField("Enter your UserName", text: $textInfo)
                    Button("Submit", role: .cancel) {
                        infoShow = textInfo
                    }
                } message: {
                    Text("Please enter your UserName")
                }
                Text("My Name is: \(infoShow)")
                    .padding()
                    .font(.title)
                    .foregroundColor(Color.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(name: "Lesson 2")
            .previewDisplayName("Light Mode")
            .environment(\.colorScheme, .light)
        ContentView(name: "Lesson 2")
            .previewDisplayName("Dark Mode")
            .environment(\.colorScheme, .dark)
    }
}

