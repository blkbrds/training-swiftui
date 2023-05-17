//
//  MapScreen.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 08/05/2023.
//

import SwiftUI

struct MapView: View {
    
    @State var testString: String = ""
    
    var body: some View {
        VStack {
            TextField("Please input", text: $testString)
            Text("Map")
                .font(.system(size: 20))
                .padding()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
