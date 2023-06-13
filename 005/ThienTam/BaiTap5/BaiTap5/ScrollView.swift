//
//  ScrollView.swift
//  BaiTap5
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 08/06/2023.
//

import SwiftUI

struct HomeScrollView: View {

    @State private var searchText = ""
    let strings: [String] = ["A", "N", "H", "Y", "E", "U", "E", "M"]
    @State private var selectedTab = 0

    var body: some View {
        // Home View
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        Text("Hi, BAOLINHUU")
                            .font(.largeTitle)
                            .headerModifier()
                        Spacer()
                    }
                    HStack {
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(.gray.opacity(0.1))

                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray.opacity(0.8))

                                TextField("Search for the name of the photo", text: $searchText)
                                    .foregroundColor(.black)
                                    .padding(.leading, 8)
                            }
                                .padding(.horizontal, 10)
                        }
                            .frame(height: 50)

                        Spacer()

                        Image(systemName: "mic.fill")
                            .foregroundColor(.blue)
                    }
                        .padding([.leading, .trailing], 20)

                    VStack {
                        HStack {
                            Text("My Querry")
                                .font(.title)
                                .headerModifier()
                            Spacer()
                        }

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<strings.count, id: \.self) { index in
                                    ItemView(contentTitle: strings[index])
                                }
                            }
                                .padding([.trailing, .leading], 20)
                        }

                        HStack {
                            Text("Popular")
                                .font(.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .padding(20)
                            Spacer()
                            Text("view all")
                                .font(.title3)
                                .foregroundColor(.pink)
                                .padding([.bottom, .trailing], 20)
                                .headerModifier()
                        }

                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: 20) {
                                ForEach(0..<strings.count, id: \.self) { index in
                                    PopularView()
                                }
                            }
                        }

                    }
                    Spacer()
                }
                    .navigationBarItems(leading: sideMenuButton, trailing: profileButton)
            }
        }
    }

    var sideMenuButton: some View {
        Button(action: {
            // Handle side menu button tap
        }) {
            Image(systemName: "line.horizontal.3")
                .font(.title)
        }
    }

    var profileButton: some View {
        Button(action: {
            // Handle profile button tap
        }) {
            Image(systemName: "person")
                .font(.title)
        }
    }
}


struct ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScrollView()
    }
}

