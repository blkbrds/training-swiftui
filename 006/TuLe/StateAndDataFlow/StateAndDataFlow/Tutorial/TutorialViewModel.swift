//
//  TutorialViewModel.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 19/04/2023.
//

import Foundation

class TutorialViewModel: ObservableObject {

    @Published var pages: [TutorialModel] = TutorialModel.samplePages
    
    func handlePage(page: TutorialModel) -> Bool {
        return page == pages.last
    }
}
