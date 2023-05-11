//
//  DynamicListView.swift
//  List
//
//  Created by Tu Le C. [2] VN.Danang on 27/04/2023.
//

import SwiftUI

struct DynamicListView: View {
    var weathers = Weather.dummyData()
    var body: some View {
        NavigationStack {
            List(weathers) { item in
                NavigationLink {
                    DynamicListDetail(weather: item)
                } label: {
                    WeatherRow(weather: item)
                }
            }
            .navigationBarTitle("DynamicList")
        }
    }
}

struct DynamicListView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicListView()
    }
}

struct WeatherRow: View {
    var weather: Weather
    
    var body: some View {
        HStack {
            Image(weather.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                HStack {
                    Text(weather.nickname)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.black)
                    if weather.isBlueTick {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.blue)
                    }
                }
                Text(weather.name)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .cornerRadius(10)
        .frame(maxWidth: .infinity)
    }
}
