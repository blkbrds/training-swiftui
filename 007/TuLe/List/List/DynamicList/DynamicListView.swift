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
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 10))
                }
            }
            .navigationBarTitle("DynamicList", displayMode: .inline)
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
            VStack(alignment: .leading) {
                Text(weather.city)
                    .font(.title)
                    .lineLimit(1)
                Text(weather.country)
                    .fontWeight(.bold)
            }
            Spacer()
            Text("\(weather.temperature)°C")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.all)
        }
        .padding()
        .background(Image(weather.getStatusString()).resizable().brightness(-0.1))
        .cornerRadius(10)
        .foregroundColor(.white)
    }
}
