//
//  ContentView.swift
//  BaiTap5
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 07/06/2023.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack(spacing: 50) {
            CustomButton(titleButton: "Email", titleBadge: "100", actionButton: {
                //
            }, kind: .topright)
            
            CustomButton(titleButton: "Friends", titleBadge: "50", actionButton: {
                //
            }, kind: .topleft)
            
            CustomButton(titleButton: "Photos", titleBadge: "50", actionButton: {
                //
            }, kind: .bottomleft)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
