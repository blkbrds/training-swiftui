//
//  DisclosureListViewModel.swift
//  List
//
//  Created by Tu Le C. [2] VN.Danang on 12/05/2023.
//

import Foundation
import SwiftUI

final class DisclosureGroupListViewModel: ObservableObject {

    @AppStorage("isOpenArray") var data: Data?
    @Published var items = QAndAItems.dummyData()

    func getData() {
        let decoder = JSONDecoder()
        if let data = data,
           let dataItems = try? decoder.decode([QAndAItems].self, from: data) {
            items = dataItems
        }
    }

    func saveData() {
        let encoder = JSONEncoder()
        let encode = try? encoder.encode(items.self)
        data = encode
    }
}
