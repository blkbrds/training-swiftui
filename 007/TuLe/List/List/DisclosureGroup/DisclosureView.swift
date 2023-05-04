//
//  DisclosureView.swift
//  List
//
//  Created by Tu Le C. [2] VN.Danang on 04/05/2023.
//

import SwiftUI

struct DisclosureView: View {
    
    @State var items = QAndAItems.dummyData()
    @State private var editMode = EditMode.inactive
    
    var body: some View {
        List {
            ForEach(0 ..< items.count) { index in
                DisclosureGroup(
                    isExpanded: $items[index].isShowContent,
                    content: {
                        Text(items[index].answer)
                            .font(.body)
                            .fontWeight(.light)
                    },
                    label: {
                        Text("\(index + 1). \(items[index].question)")
                            .font(.body)
                            .fontWeight(.bold)
                    })
            }
        }
        .environment(\.editMode, $editMode)
    }
}

struct DisclosureView_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureView()
    }
}

struct QAndAItems: Identifiable {
    var id = UUID()
    var question: String
    var answer: String
    var isShowContent = false
    
    static func dummyData() -> [QAndAItems] {
        return [
            QAndAItems(question: "Cách học swiftUI", answer: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
            QAndAItems(question: "Cách để trở thành master swiftUI", answer: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
            QAndAItems(question: "Có thể học swiftUI ở đâu", answer: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
        ]
    }
}
