//
//  ExpandableListView.swift
//  List
//
//  Created by Tu Le C. [2] VN.Danang on 04/05/2023.
//

import SwiftUI

struct ExpandableListView: View {
    
    var body: some View {
        List {
            Section {
                OutlineGroup(ExpandableListView.SFSymbolsMenuItems, children: \.subMenuItems) { item in
                    HStack {
                        Image(systemName: item.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                        Text(item.name)
                            .font(.system(.title3, design: .rounded))
                            .bold()
                    }
                }
                .listStyle(.insetGrouped)
            } header: {
                Section() {
                    Image("logoSF")
                        .resizable()
                        .frame(height: 150)
                        .listRowInsets(EdgeInsets())
                        .cornerRadius(20)
                }
            }
        }
        .listStyle(.insetGrouped)
    }
}

extension ExpandableListView {
    static let SFSymbolsMenuItems = [
        MenuItem(name: "Weather", image: "cloud.sun", subMenuItems: weathers),
        MenuItem(name: "Accessibility", image: "figure.wave.circle", subMenuItems: accessibility)
    ]
    
    static let weathers = [
        MenuItem(name: "Sun", image: "sun.max.fill", subMenuItems: subMenuSun),
        MenuItem(name: "Moon", image: "moon.circle.fill"),
        MenuItem(name: "Cloud", image: "cloud", subMenuItems: subMenuCloud)
    ]
    
    static let accessibility = [
        MenuItem(name: "figure.stand.line.dotted.figure.stand", image: "figure.stand.line.dotted.figure.stand"),
        MenuItem(name: "figure.roll", image: "figure.roll", subMenuItems: [
            MenuItem(name: "figure.roll.runningpace", image: "figure.roll.runningpace")
        ]),
        MenuItem(name: "digitalcrown.arrow.clockwise", image: "digitalcrown.arrow.clockwise", subMenuItems: subMenuDigitalcrown),
        MenuItem(name: "eye", image: "eye")
    ]
    
    static let subMenuSun = [
        MenuItem(name: "sun.min.fill", image: "sun.min.fill"),
        MenuItem(name: "sunrise", image: "sunrise"),
        MenuItem(name: "sun.max.circle.fill", image: "sun.max.circle.fill"),
        MenuItem(name: "sunset.circle.fill", image: "sunset.circle.fill"),
        MenuItem(name: "sun.dust.fill", image: "sun.dust.fill"),
        MenuItem(name: "sun.haze.circle.fill", image: "sun.haze.circle.fill")
    ]
    
    static let subMenuCloud = [
        MenuItem(name: "cloud.circle", image: "cloud.circle"),
        MenuItem(name: "cloud.drizzle.fill", image: "cloud.drizzle.fill"),
        MenuItem(name: "cloud.rain.fill", image: "cloud.rain.fill"),
        MenuItem(name: "cloud.rain.circle.fill", image: "cloud.rain.circle.fill"),
        MenuItem(name: "cloud.heavyrain.fill", image: "cloud.heavyrain.fill"),
        MenuItem(name: "cloud.fog.fill", image: "cloud.fog.fill")
    ]
    
    static let subMenuDigitalcrown = [
        MenuItem(name: "digitalcrown.arrow.clockwise.fill", image: "digitalcrown.arrow.clockwise.fill"),
        MenuItem(name: "digitalcrown.arrow.clockwise.fill", image: "digitalcrown.arrow.clockwise.fill"),
        MenuItem(name: "digitalcrown.arrow.counterclockwise.fill", image: "digitalcrown.arrow.counterclockwise.fill")
    ]
}

struct MenuItem: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var subMenuItems: [MenuItem]?
}

struct ExpandableListView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableListView()
    }
}
