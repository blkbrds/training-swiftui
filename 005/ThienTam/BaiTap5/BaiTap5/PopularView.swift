//
//  PopularView.swift
//  BaiTap5
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 08/06/2023.
//

import SwiftUI

struct PopularView: View {
    var body: some View {
        Rectangle()
            .frame(height: 100)
            .foregroundColor(Color.gray.opacity(0.1))
            .cornerRadius(20)
            .overlay {
                HStack() {
                    Image("bear")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .cornerRadius(20)
                        .padding(.leading, 20)
                    Spacer()
                    VStack() {
                        Text("Henning-olsnes slow")
                            .font(.subheadline)
                            .bold()
                        Text("Chumed icecream")
                            .font(.subheadline)
                    }
                    Spacer()
                    Text("...")
                        .font(.title3)
                        .foregroundColor(.pink)
                        .padding(.trailing, 20)
                }
            }
            .padding([.trailing, .leading], 20)
    }
}

struct PopularView_Previews: PreviewProvider {
    static var previews: some View {
        PopularView()
    }
}
