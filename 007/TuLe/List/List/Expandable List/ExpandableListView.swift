//
//  ExpandableListView.swift
//  List
//
//  Created by Tu Le C. [2] VN.Danang on 04/05/2023.
//

import SwiftUI

struct ExpandableListView: View {

    let phones = [
        Phone(name: "Apple", image: "iphone", subListPhone: apple),
        Phone(name: "Samsung", image: "iphone.rear.camera", subListPhone: samsung)
    ]

    var body: some View {
        List(phones, children: \.subListPhone) { item in
            HStack {
                Image(systemName: item.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                Text(item.name)
                    .font(.system(.title3, design: .rounded))
                    .bold()
            }
        }
        .listStyle(.insetGrouped)
    }
}

extension ExpandableListView {
    static let apple = [
        Phone(name: "iPhone13 Pro Max", image: "iphone"),
        Phone(name: "iPhone14 Pro Max", image: "iphone"),
        Phone(name: "iPhone11", image: "iphone")
    ]
    static let samsung = [
        Phone(name: "Galaxy A24", image: "iphone.rear.camera"),
        Phone(name: "Galaxy S23 Ultra", image: "iphone.rear.camera"),
        Phone(name: "Galaxy Z Fold4", image: "iphone.rear.camera"),
        Phone(name: "Galaxy S23+ 5G", image: "iphone.rear.camera")
    ]
}

struct Phone: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var subListPhone: [Phone]?
}

struct ExpandableListView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableListView()
    }
}
