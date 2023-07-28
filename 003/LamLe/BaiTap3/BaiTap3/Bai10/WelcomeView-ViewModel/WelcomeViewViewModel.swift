//
//  WelcomeViewViewModel.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/25/23.
//

import Foundation

struct TutorialModel {
    var imageTutorial: [String]
    var titleTextTutorial: [String]
    var contentTextTutorial: [String]
    
    init(imageTutorial: [String], titleTextTutorial: [String], contentTextTutorial: [String]) {
        self.imageTutorial = imageTutorial
        self.titleTextTutorial = titleTextTutorial
        self.contentTextTutorial = contentTextTutorial
    }
}

final class WelcomeViewViewModel: ObservableObject {
    var model: TutorialModel = TutorialModel(imageTutorial: ["pizza_icon_welcome", "delivery_img_welcome", "chooseFood_img_welcome", "manWithCream"], titleTextTutorial: ["All your favorites", "Free delivery offers", "Choose your food", "Welcome"], contentTextTutorial: ["Order from the best local restaurants win easy, on-demand delivery", "Free delivery for new customers via Apple Pay and others payment methods", "Easily find your type of food craving and you'll get delivery in wide range", "It’s a pleasure to meet you. We are excited that you’re here so let’s get started!"])
    
    func getImageTutorial(page: Int) -> String {
        return model.imageTutorial[page]
    }
    
    func getTitleTextTutorial(page: Int) -> String {
        return model.titleTextTutorial[page]
    }
    
    func getContentTextTutorial(page: Int) -> String {
        return model.contentTextTutorial[page]
    }
    
}
