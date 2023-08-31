//
//  EquatableExts.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 31/08/2023.
//

import Foundation

extension Equatable {
    func isOneOf(_ other: Self...) -> Bool {
        return other.contains(self)
    }
}
