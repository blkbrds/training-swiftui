//
//  PlusView.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 10/05/2023.
//

import SwiftUI

struct PlusView: View {

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to Nectar Grocery Store!   \(Image("carrot"))")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("green"))
            

            Text("We provide high quality grocery products at reasonable prices.")
                .font(.body)
                .multilineTextAlignment(.center)

            AsyncImage(url: URL(string: "https://images.pexels.com/photos/15222245/pexels-photo-15222245.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }

            Text("We are your one-stop shop for all your grocery needs. From fresh produce to household essentials, we have it all. Shop with us today!")
                .font(.body)
                .padding(.horizontal, 20)

            Text("We always want to bring convenience and satisfaction to our customers.")
                .font(.body)
        }
            .padding()
    }
}

struct PlusView_Previews: PreviewProvider {
    static var previews: some View {
        PlusView()
    }
}
