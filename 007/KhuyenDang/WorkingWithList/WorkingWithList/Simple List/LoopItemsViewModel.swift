//
//  LoopItemsViewModel.swift
//  WorkingWithList
//
//  Created by Khuyen Dang T.T. VN.Danang on 24/04/2023.
//

import Foundation

final class LoopItemsViewModel: ObservableObject {

    @Published var users: [User] = [
        User(name: "Khuyên", address: "Quảng Ngãi, Việt Nam"),
        User(name: "Anh Tâm", address: "Thành phố Huế, Việt Nam"),
        User(name: "Anh Lý", address: "Quảng Nam, Việt Nam"),
        User(name: "Tính", address: "Quảng Bình, Việt Nam"),
        User(name: "Anh Hải", address: "Thành phố Đà Nẵng, Việt Nam")
    ]
}
