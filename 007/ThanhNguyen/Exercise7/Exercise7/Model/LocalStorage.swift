//
//  LocalStorage.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 20/09/2023.
//

import SwiftUI

class LocalStorage: ObservableObject {

    @AppStorage("listQuestion") var items: [QandA]? = nil

    public func saveListQuestion(items: [QandA]) {
        self.items = items
    }
}
