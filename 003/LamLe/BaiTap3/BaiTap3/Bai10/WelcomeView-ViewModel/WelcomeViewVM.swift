//
//  WelcomeViewVM.swift
//  BaiTap3
//
//  Created by Lam Le T. [2] VN.Danang on 7/25/23.
//

import Foundation

final class WelcomeViewVM: ObservableObject {
    @Published var imageTutorial: [String] = ["pizza_icon_welcome", "delivery_img_welcome", "chooseFood_img_welcome"]
    @Published var titleTextTutorial: [String] = ["All your favorites", "Free delivery offers", "Choose your food"]
    @Published var contentTextTutorial: [String] = ["Order from the best local restaurants win easy, on-demand delivery", "Free delivery for new customers via Apple Pay and others payment methods", "Easily find your type of food craving and you'll get delivery in wide range"]
    let imageIntrodule: String = "manWithCream"
    let titleIntrodule: String = "Welcome"
    let contentIntrodule: String = "It’s a pleasure to meet you. We are excited that you’re here so let’s get started!"
    
    func getImageTutorial(page: Int) -> String {
        return imageTutorial[page]
    }
    
    func getTitleTextTutorial(page: Int) -> String {
        return titleTextTutorial[page]
    }
    
    func getContentTextTutorial(page: Int) -> String {
        return contentTextTutorial[page]
    }
    
}
