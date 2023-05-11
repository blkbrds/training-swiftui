//
//  DisclosureListView.swift
//  List
//
//  Created by Tu Le C. [2] VN.Danang on 04/05/2023.
//

import SwiftUI

struct DisclosureListView: View {
    
    @State private var editMode = EditMode.inactive
    @StateObject var viewModel = DisclosureGroupListViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.backward")
                    Text("Back")
                })
                Spacer()
            }
            .padding(.leading, 10)
            .padding(.horizontal, 20)

            List {
                ForEach(0 ..< viewModel.items.count) { index in
                    DisclosureGroup(
                        isExpanded: $viewModel.items[index].isShowContent,
                        content: {
                            Text(viewModel.items[index].answer)
                                .font(.body)
                                .fontWeight(.light)
                        },
                        label: {
                            Text("\(index + 1). \(viewModel.items[index].question)")
                                .font(.body)
                                .fontWeight(.bold)
                        })
                }
            }
            .onAppear {
                viewModel.getData()
            }
            .onDisappear {
                viewModel.saveData()
            }
            .environment(\.editMode, $editMode)
        }
    }
}

struct DisclosureListView_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureListView()
    }
}

struct QAndAItems: Identifiable, Codable {
    var id = UUID()
    var question: String
    var answer: String
    var isShowContent = false
    
    static func dummyData() -> [QAndAItems] {
        return [
            QAndAItems(question: "Cách học swiftUI", answer: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
            QAndAItems(question: "Cách để trở thành master swiftUI", answer: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
            QAndAItems(question: "Có thể học swiftUI ở đâu", answer: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
            QAndAItems(question: "SwiftUI có khó không?", answer: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
            QAndAItems(question: "SwiftUI hiện tại có nhiều người học không", answer: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
        ]
    }
}
