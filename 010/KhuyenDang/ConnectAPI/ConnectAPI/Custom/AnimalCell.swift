//
//  AnimalCell.swift
//  ConnectAPI
//
//  Created by Khuyen Dang T.T. VN.Danang on 07/06/2023.
//

import SwiftUI

struct AnimalCell: View {

    let animal: Animal

    var body: some View {

        HStack(spacing: 16) {
            AsyncImage(url: URL(string: animal.detail?.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .overlay(
                    Circle().stroke(Color.gray, lineWidth: 0.5)
                )
            } placeholder: {
                //                Color.gray.opacity(0.1)
                //                    .frame(width: 80, height: 80)
                ProgressView()
                    .frame(width: 80, height: 80)
            }
            HStack {
                VStack(alignment: .leading, spacing: 7) {
                    Text(animal.name)
                        .font(.title)
                        .fontWeight(.bold)

                    Text("Life cycle: \(animal.lifeCycle)")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Text("Breed: \(animal.breed ?? "")")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Text("Origin: \(animal.origin ?? "")")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
        }
            .padding(16)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 2)
    }
}

struct AnimalCell_Previews: PreviewProvider {
    static var previews: some View {
        ConnectUrlsApiView()
    }
}
