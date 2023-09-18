//
//  PersonCell.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 18/09/2023.
//

import SwiftUI

struct PersonCell: View {

    let person: Person

    var body: some View {
        HStack(spacing: 30) {
            Image(person.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(.infinity)
            VStack(spacing: 10) {
                Text(person.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                Text(person.job.rawValue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black.opacity(0.6))
            }
            Image(systemName: "info.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)
        }
    }
}

struct PersonCell_Previews: PreviewProvider {
    static var previews: some View {
        PersonCell(person: .init(
            name: "Thanh",
            imageName: "img_luffy_g5",
            job: .navy)
        )
    }
}
