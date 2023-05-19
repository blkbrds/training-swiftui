//
//  FavoriteScreen.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 08/05/2023.
//

import SwiftUI

struct CartView: View {

    @EnvironmentObject var tabbarRouter: TabBarRouter
    var body: some View {
        VStack {
            Text("Cart")
                .font(.system(size: 20))
                .padding()
            MySubTabView(tabbarRouter: tabbarRouter)
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
