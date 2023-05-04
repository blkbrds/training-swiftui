//
//  SectionListView.swift
//  List
//
//  Created by Tu Le C. [2] VN.Danang on 04/05/2023.
//

import SwiftUI

struct SectionListView: View {
    
    let network = ["Wi-Fi", "Bluetooth","Di động"]
    let general = ["Cài đặt chung", "Trung tâm điều khiển", "Màn hình và độ sáng"]
    let individual = ["App Store", "Ví"]

    var body: some View {
        NavigationView {
            List {
                Section("Network") {
                    ForEach(network, id: \.self) { item in
                        if item == network.first {
                            Toggle("Wi-Fi", isOn: .constant(true))
                        } else {
                            Text(item)
                        }
                    }
                }
                Section {
                    ForEach(general, id: \.self) { item in
                        Text(item)
                    }
                }
                Section {
                    ForEach(individual, id: \.self) { item in
                        Text(item)
                    }
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("Settings")
        }
    }
}

struct SectionListView_Previews: PreviewProvider {
    static var previews: some View {
        SectionListView()
    }
}
