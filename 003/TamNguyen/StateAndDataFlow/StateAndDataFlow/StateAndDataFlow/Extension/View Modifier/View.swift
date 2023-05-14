//
//  View.swift
//  StateAndDataFlow
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 14/05/2023.
//

import SwiftUI

extension View {
    func cornerRadiusCommon() -> some View {
        return self
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
    }
}

