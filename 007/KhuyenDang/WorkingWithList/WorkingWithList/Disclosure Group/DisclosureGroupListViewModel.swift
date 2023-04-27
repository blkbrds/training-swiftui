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
    @Published var openArray: MyArrayOpen = MyArrayOpen(values: [Bool](repeating: false, count: 7))

    private let dummyItems: [QAItem] = [QAItem(question: "Học swiftUI có vui không?", answer: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English"),
        QAItem(question: "Nên đi làm hay nghỉ 2 ngày sau lễ?", answer: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged"),
        QAItem(question: "Tài chính dưới 30 triệu thì nên đi du lịch ở đâu, cụ thể là 200k?", answer: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet"),
        QAItem(question: "Có nên ăn cháo gà khi bị cảm?", answer: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco"),
        QAItem(question: "Cách không học bài mà vẫn thi được điểm cao", answer: "dolor sit amet, consectetur, adipisci velit, sed quia non numquam"),
        QAItem(question: "Các bài tập thể dục giảm cân", answer: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."),
        QAItem(question: "Review trang https://fxstudio.dev/", answer: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et exped.")
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
