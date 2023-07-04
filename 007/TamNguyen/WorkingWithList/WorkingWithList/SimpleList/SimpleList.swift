//
//  ContentView.swift
//  WorkingWithList
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 28/06/2023.
//

import SwiftUI

struct SimpleList: View {
    var body: some View {
        List {
            Button(action: {

            }) {
                Text("Button")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            Image(systemName: "heart.fill")
                .foregroundColor(.red)
                .font(.system(size: 24))

            Text("Hello, SwiftUI!")
                .font(.title)
                .foregroundColor(.black)
        }
        .listStyle(.grouped)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleList()
    }
}
