//
//  EditViewModel.swift
//  StateAndDataFlow
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 23/06/2023.
//

import SwiftUI

@MainActor
class EditViewModel: ObservableObject {

    @Published var username: String = ""

    var titleButton: String { isLoginButtonEnabled ? "Change" : "Submit" }
    var colorButton: Color { isLoginButtonEnabled ? Color("submitButton") : Color.gray.opacity(0.5) }

    var isLoginButtonEnabled: Bool {
        return username.count >= 2
    }
    
    func editFullName() {
        LocalStore.shared.updateFullName(name: username)
    }
}

