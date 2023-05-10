//
//  FavoriteScreen.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 08/05/2023.
//

import SwiftUI

struct CartView: View {

    @Binding var selectedTab: Tab

    var body: some View {
        VStack {
            Text("Cart")
                .font(.system(size: 20))
                .padding()
            MySubTabView(selectedTab: $selectedTab)
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(selectedTab: .constant(.cart))
    }
}
