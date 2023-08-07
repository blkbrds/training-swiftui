//
//  WelcomeViewViewModel.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/25/23.
//

import Foundation

struct TutorialModel {
    var imageTutorial: String
    var titleTextTutorial: String
    var contentTextTutorial: String
    
    init(imageTutorial: String, titleTextTutorial: String, contentTextTutorial: String) {
        self.imageTutorial = imageTutorial
        self.titleTextTutorial = titleTextTutorial
        self.contentTextTutorial = contentTextTutorial
    }
}

final class WelcomeViewViewModel: ObservableObject {
    
    var model: [TutorialModel] = [TutorialModel(imageTutorial: WelcomeViewKey.imageFavorite, titleTextTutorial: WelcomeViewKey.titleFavorite, contentTextTutorial: WelcomeViewKey.contentFavorite), TutorialModel(imageTutorial: WelcomeViewKey.imageDelivery, titleTextTutorial: WelcomeViewKey.titleDelivery, contentTextTutorial: WelcomeViewKey.contentDelivery), TutorialModel(imageTutorial: WelcomeViewKey.imageChoiceFood, titleTextTutorial: WelcomeViewKey.titleChoiceFood, contentTextTutorial: WelcomeViewKey.contentChoiceFood)]
    
        func getInfoTutorial(page: Int) -> TutorialModel {
            return model[page]
        }
}
