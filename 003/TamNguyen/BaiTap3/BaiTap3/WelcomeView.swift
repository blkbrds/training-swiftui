//
//  WelcomeView.swift
//  BaiTap3
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 23/05/2023.
//

import SwiftUI

struct WelcomeView: View {

    let names: [String] = ["veterinary", "grooming", "petboarding", "adoption", "dogwalking", "training", "pettaxi", "petdate", "other"]

    var body: some View {

        NavigationView {
            VStack {
                VStack {
                    Text("What are you \n looking for, ")
                        .font(.system(size: 40))

                        +
                        Text("Maria?")
                        .bold()
                        .foregroundColor(.yellow)
                    .font(.system(size: 40))
                }
                .padding(.top, 50)

                ForEach(0..<3) { row in
                    HStack {
                        ForEach(0..<3) { column in
                            let index = row * 3 + column
                            if index < names.count {
                                VStack {
                                    Image("\(names[index])")
                                        .resizable()
                                        .frame(width: 100, height: 100, alignment: .leading)
                                }
                            } else {
                                Spacer()
                            }
                        }
                    }
                }
                Spacer()
            }
                .navigationBarItems(trailing:
                    Button(action: {
                }) {
                    Image(systemName: "magnifyingglass")
                }
            )
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
