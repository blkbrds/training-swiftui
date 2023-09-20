//
//  DisclosureGroupView.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 20/09/2023.
//

import SwiftUI

struct DisclosureGroupView: View {

    @State var isPresented: Bool = false

    var body: some View {
        RoundedRectangle(cornerRadius: .infinity)
            .fill(.gray)
            .frame(width: 200, height: 80)
            .overlay {
                Text("Present view")
                    .foregroundStyle(.white)
                    .font(.title)
            }
            .onTapGesture {
                isPresented.toggle()
            }
            .sheet(isPresented: $isPresented, content: {
                DisclosureGroupListView()
            })
    }
}

struct DisclosureGroupView_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureGroupView()
    }
}
