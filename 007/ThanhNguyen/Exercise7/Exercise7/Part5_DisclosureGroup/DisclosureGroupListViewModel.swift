//
//  DisclosureGroupListViewModel.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 20/09/2023.
//

import Foundation
import SwiftUI

class DisclosureGroupListViewModel: ObservableObject {

    @Published var items = QandA.listQuestion
    private let localStorage = LocalStorage()

    public func saveListQuestion() {
        localStorage.saveListQuestion(items: items)
    }
}
