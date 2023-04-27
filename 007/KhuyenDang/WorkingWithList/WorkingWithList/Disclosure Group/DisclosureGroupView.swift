//
//  DisclosureGroupView.swift
//  WorkingWithList
//
//  Created by Khuyen Dang T.T. VN.Danang on 26/04/2023.
//

import SwiftUI

struct DisclosureGroupView: View {

    @State var isPressed: Bool = false

    var body: some View {
        Button(action: {
            isPressed.toggle()
        }, label: {
                Text("Press me!")
            })
            .buttonStyle(MyButtonStyle())
            .fullScreenCover(isPresented: $isPressed) {
                DisclosureGroupListView()
            }
    }
}

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.2)
            .animation(.spring(), value: configuration.isPressed)
    }
}

struct DisclosureGroupView_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureGroupView()
    }
}
