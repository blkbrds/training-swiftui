//
// SimpleList3.swift
// List
//
// Created by Tu Le C. [2] VN.Danang on 25/04/2023.
//

import SwiftUI

struct SimpleList3: View {
    var array: [(imageName: String, title: String)] = [
        (imageName:"gear", title: "General"),
        (imageName: "textformat.size", title: "Display"),
        (imageName: "figure.arms.open", title: "Accessibility"),
        (imageName: "speaker.wave.2.fill", title: "Sound")
    ]
    var body: some View {
        List {
            ForEach(0 ..< array.count) { i in
                Row1(imageName: array[i].imageName, title: array[i].title)
            }
        }
    }
}

struct Row1: View {
    var imageName: String
    var title: String
    var body: some View {
        HStack {
            Image(systemName: imageName)
            Text(title)
        }
    }
}

struct SimpleList3_PreviewProvider: PreviewProvider {
    static var previews: some View {
        SimpleList3()
    }
}
