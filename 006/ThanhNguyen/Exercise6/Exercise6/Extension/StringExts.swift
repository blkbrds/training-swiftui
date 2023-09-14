//
//  StringExts.swift
//  Exercise6
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 29/08/2023.
//

import Foundation

extension String {
    public func isMatch(regex: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: regex) else { return false }
        let range = NSRange(location: 0, length: self.utf16.count)
        return regex.firstMatch(in: self, range: range) != nil
    }
}
