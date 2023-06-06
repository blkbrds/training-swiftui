//
//  TutorialModel.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 12/04/2023.
//

import Foundation

struct TutorialModel: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
}

extension TutorialModel {
    static var samplePage = TutorialModel(name: "Title Example", description: "This is a sample description for the purpose of debugging", imageUrl: "tutorial1", tag: 0)
    
    static var samplePages: [TutorialModel] = [
        TutorialModel(name: "Welcome to Default App!", description: "The best app to get stuff done on an app.", imageUrl: "tutorial1", tag: 0),
        TutorialModel(name: "Meet new people!", description: "The perfect place to meet new people so you can meet new people!", imageUrl: "tutorial2", tag: 1),
        TutorialModel(name: "Edit your face", description: "Don't like your face? Well then edit your face with our edit-face tool!", imageUrl: "tutorial3", tag: 2),
    ]
}
