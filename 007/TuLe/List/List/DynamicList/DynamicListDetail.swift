//
//  DynamicListDetail.swift
//  List
//
//  Created by Tu Le C. [2] VN.Danang on 04/05/2023.
//

import SwiftUI

struct DynamicListDetail: View {
    var weather: Weather
    
    var body: some View {
        VStack(alignment: .center) {
            Image(weather.getStatusString())
                .resizable()
                .frame(width: 300, height: 300)
                .clipShape(Circle())
            HStack {
                VStack(alignment: .leading) {
                    Text(weather.city)
                        .font(.title)
                    Text(weather.country)
                        .fontWeight(.thin)
                }
                Spacer()
                Text("\(weather.temperature)°C")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.all)
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle(Text(weather.city), displayMode: .inline)
    }
}
