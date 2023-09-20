//
//  ExpandableListViewModel.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 20/09/2023.
//

import Foundation

class ExpandableListViewModel: ObservableObject {
    @Published var items: [MenuItem] = [
        .init(imageName: "house.fill", title: "Living room", subItems: [
            .init(imageName: "lightbulb.fill", title: "Light", subItems: [
                .init(imageName: "lamp.desk.fill", title: "Lamp desk"),
                .init(imageName: "lamp.table.fill", title: "Lamp table"),
                .init(imageName: "lamp.ceiling.fill", title: "Lamp Ceiling"),
                .init(imageName: "lamp.floor.fill", title: "Lamp Floor")
            ]),
            .init(imageName: "fan.desk", title: "Fan"),
            .init(imageName: "door.left.hand.open", title: "Door"),
            .init(imageName: "wifi.router.fill", title: "Router wifi"),
            .init(imageName: "light.beacon.max.fill", title: "Warning")
        ]),
        .init(imageName: "antenna.radiowaves.left.and.right", title: "Connectivity", subItems: [
            .init(imageName: "icloud.fill", title: "iCloud"),
            .init(imageName: "bolt.horizontal.icloud.fill", title: "Messenger"),
            .init(imageName: "personalhotspot.circle.fill", title: "Personal Hotspot"),
            .init(imageName: "arrow.down.square", title: "Download"),
            .init(imageName: "network", title: "Network")
        ]),
        .init(imageName: "cloud.sun", title: "Weather", subItems: [
            .init(imageName: "cloud.rain.fill", title: "Rain"),
            .init(imageName: "wind.circle.fill", title: "Windy"),
            .init(imageName: "sun.max.fill", title: "Sunny"),
            .init(imageName: "cloud.snow.fill", title: "Snow"),
            .init(imageName: "hurricane", title: "Typhoon"),
            .init(imageName: "tornado", title: "Tornado")
        ])
    ]
}
