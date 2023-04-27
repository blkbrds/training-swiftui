//
//  DisclosureGroupListViewModel.swift
//  WorkingWithList
//
//  Created by Khuyen Dang T.T. VN.Danang on 26/04/2023.
//

import Foundation
import SwiftUI

final class DisclosureGroupListViewModel: ObservableObject {

    @AppStorage("isOpenArray") var isOpenArray: Data?
    @Published var openArray: MyArrayOpen = MyArrayOpen(values: [Bool](repeating: false, count: 4))

    private let dummyItems: [QAItem] = [QAItem(question: "Học swiftUI có vui không?", answer: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English"),
        QAItem(question: "Nên đi làm hay nghỉ 2 ngày sau lễ?", answer: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged"),
        QAItem(question: "Tài chính dưới 30 triệu thì nên đi du lịch ở đâu, cụ thể là 200k?", answer: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet"),
        QAItem(question: "Học swiftUI có vui không?", answer: "")
    ]

    func dummyData() -> [QAItem] {
        return dummyItems
    }

    func viewModelForItem(index: Int) -> QAItem {
        return dummyItems[index]
    }

    func decodedData() {
        if let data = isOpenArray, let decoded = try? JSONDecoder().decode(MyArrayOpen.self, from: data) {
            openArray = decoded
        }
    }

    func encodedData() {
        if let encoded = try? JSONEncoder().encode(openArray) {
            isOpenArray = encoded
        }
    }
}
