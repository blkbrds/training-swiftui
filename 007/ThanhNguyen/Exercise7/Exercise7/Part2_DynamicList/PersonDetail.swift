//
//  PersonDetail.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 18/09/2023.
//

import SwiftUI

struct PersonDetail: View {

    let person: Person

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image(person.imageName)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .cornerRadius(.infinity)
                Text(person.name)
                    .font(.system(size: 50, weight: .heavy))
                Text(person.job.rawValue)
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.black.opacity(0.5))
                Spacer()
            }
        }
        .navigationBarTitle("Detail", displayMode: .inline)
    }
}

struct PersonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetail(person: .init(
            name: "Thanh",
            imageName: "img_luffy_g5",
            job: .pirate
        ))
    }
}
