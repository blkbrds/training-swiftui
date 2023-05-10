//
//  MapScreen.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 08/05/2023.
//

import SwiftUI

struct MapView: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        VStack {
            Text("Map")
                .font(.system(size: 20))
                .padding()
            MySubTabView(selectedTab: $selectedTab)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(selectedTab: .constant(.map))
    }
}
