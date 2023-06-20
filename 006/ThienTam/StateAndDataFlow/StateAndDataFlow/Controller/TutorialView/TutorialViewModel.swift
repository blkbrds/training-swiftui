//
//  TutorialViewModel.swift
//  StateAndDataFlow
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 20/06/2023.
//

import SwiftUI

final class TutorialViewModel {

    func isCheckHaveUser() -> Bool {
        return DataManager().getCurrentUser() != nil
    }
}
