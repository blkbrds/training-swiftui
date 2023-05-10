//
//  HomeView.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 08/05/2023.
//

import SwiftUI

struct HomeView: View {

    @Binding var selectedTab: Tab

    var body: some View {
        VStack {
            Text("Home")
                .font(.system(size: 20))
                .padding()
            MySubTabView(selectedTab: $selectedTab)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selectedTab: .constant(.home))
    }
}
