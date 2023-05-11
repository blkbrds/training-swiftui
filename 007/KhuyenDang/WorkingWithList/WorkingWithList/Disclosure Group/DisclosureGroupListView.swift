//
//  DisclosureGroupListView.swift
//  WorkingWithList
//
//  Created by Khuyen Dang T.T. VN.Danang on 26/04/2023.
//

import SwiftUI

struct DisclosureGroupListView: View {

    @StateObject private var vm = DisclosureGroupListViewModel()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                },
                    label: {
                        Image(systemName: "chevron.backward")
                        Text("Back")
                    })
                Spacer()
            }
                .padding(.leading, 10)
            List {
                ForEach(0..<vm.dummyData().count, id: \.self) { index in
                    let item = vm.viewModelForItem(index: index)
                    DisclosureGroup(
                        isExpanded: Binding(
                            get: { vm.openArray.values[index] },
                            set: { vm.openArray.values[index] = $0 }
                        ),
                        content: {
                            Text(item.answer)
                        }, label: {
                            Text("\(index + 1). \(item.question)")
                                .font(.system(size: 20, weight: .semibold))
                        })
                        .listRowBackground(Color.white)
                }
            }
                .listStyle(.plain)
        }
            .onAppear {
            vm.decodedData()
        }
            .onDisappear {
            vm.encodedData()
        }
    }
}

struct DisclosureGroupListView_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureGroupListView()
    }
}
