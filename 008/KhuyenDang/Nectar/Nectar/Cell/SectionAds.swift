//
//  SectionAds.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 11/05/2023.
//

import SwiftUI

struct SectionAds: View {
    var body: some View {
        Section {
            TabView {
                ForEach(1..<4) { index in
                    Image("advertisement\(index)")
                        .resizable()
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
            }
                .tabViewStyle(PageTabViewStyle())
                .frame(height: 160)
        }
            .listSectionSeparator(.hidden)
            .padding(.horizontal, -20)
    }
}

struct SectionAds_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
