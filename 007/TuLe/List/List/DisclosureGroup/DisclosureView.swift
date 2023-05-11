//
//  DisclosureView.swift
//  List
//
//  Created by Tu Le C. [2] VN.Danang on 12/05/2023.
//

import SwiftUI

struct DisclosureView: View {

    @State var isPresent: Bool = false
    
    var body: some View {
        Button(action: {
            isPresent.toggle()
        }, label: {
            Text("Show Disclosure Group List View")
        })
        .fullScreenCover(isPresented: $isPresent) {
            DisclosureListView()
        }
    }
}

struct DisclosureView_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureView()
    }
}
