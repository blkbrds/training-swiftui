//
//  ContentView.swift
//  BaiTap3
//
//  Created by Tu Le C. [2] VN.Danang on 15/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    var name = "Lê Công Tú"

    var body: some View {
        VStack {
            Spacer()
            Image("no-avatar")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .clipShape(Circle())
                .padding()
                .background(Color.brown)
                .clipShape(Circle())
                .shadow(radius: 20)
                .overlay {
                    Text(name)
                        .font(.title)
                        .offset(x: 0, y: 90)
                }
                .onTapGesture {
                    print(name)
                }
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
