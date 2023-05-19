//
//  SectionListView.swift
//  List
//
//  Created by Tu Le C. [2] VN.Danang on 04/05/2023.
//

import SwiftUI

struct SectionListView: View {

    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(SectionListView.device) { item in
                        SectionListRowView(name: item.name, imageName: item.imageName)
                    }
                } header: {
                    HeaderListRowView(name: "Devices")
                } footer: {
                    FooterListRowView(name: SectionListView.footerDevice)
                }

                Section {
                    ForEach(SectionListView.weather) { item in
                        SectionListRowView(name: item.name, imageName: item.imageName)
                    }
                } header: {
                    HeaderListRowView(name: "Weather")
                } footer: {
                    FooterListRowView(name: SectionListView.footerWeather)
                }
                
                Section {
                    ForEach(SectionListView.nature) { item in
                        SectionListRowView(name: item.name, imageName: item.imageName)
                    }
                } header: {
                    HeaderListRowView(name: "Nature")
                } footer: {
                    FooterListRowView(name: SectionListView.footerNature)
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("Settings")
        }
    }
}

struct SectionListRowView: View {
    
    var name: String
    var imageName: String

    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.blue)
            Text(name)
        }
    }
}

struct HeaderListRowView: View {
    
    var name: String
    
    var body: some View {
        Text(name)
            .font(.system(size: 20, weight: .semibold))
            .foregroundColor(.blue)
    }
}

struct FooterListRowView: View {
    
    var name: String
    
    var body: some View {
        Text(name)
            .font(.system(size: 14))
            .foregroundColor(.gray)
    }
}

extension SectionListView {
    static let device: [SectionList] = [
        SectionList(name: "Iphone", imageName: "iphone"),
        SectionList(name: "Pc", imageName: "pc"),
        SectionList(name: "Headphone", imageName: "headphones")
    ]
    static let weather: [SectionList] = [
        SectionList(name: "Sun", imageName: "sun.min"),
        SectionList(name: "Cloud", imageName: "cloud.fill")
    ]
    static let nature: [SectionList] = [
        SectionList(name: "Drop", imageName: "drop.fill"),
        SectionList(name: "Flame", imageName: "flame")
    ]
    
    static let footerDevice: String = "A device is a unit of physical hardware or equipment that provides one or more computing functions within a computer system."
    static let footerWeather: String = "Weather is the mix of events that happen each day in our atmosphere."
    static let footerNature: String = "Nature, in the broadest sense, is the physical world or universe"
}

struct SectionList: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var imageName: String
}

struct SectionListView_Previews: PreviewProvider {
    static var previews: some View {
        SectionListView()
    }
}
