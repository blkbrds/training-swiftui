//
//  EditingListView.swift
//  List
//
//  Created by Tu Le C. [2] VN.Danang on 04/05/2023.
//

import SwiftUI

struct EditingListView: View {
    
    @State var selection = Set<UUID>()
    @State private var editMode = EditMode.inactive
    @State private var name: String = ""
    @State private var users: [User] = [
        User(name: "Công Tú"),
        User(name: "Phong Huỳnh"),
        User(name: "Thường Tính"),
        User(name: "Lương Trần"),
        User(name: "Thuỳ Dung"),
        User(name: "Tú Khuyên")
    ]
    
    var body: some View {
        NavigationStack {
            List(selection: $selection) {
                ForEach(users) { item in
                    Text(item.name)
                }
                .onDelete(perform: onDelete)
                .onMove(perform: onMove)
            }
            .navigationBarItems(
                leading:
                    TextField("Nhập Tên", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: UIScreen.main.bounds.width * 0.6),
                trailing: HStack {
                    editButton
                    addDelButton
                })
            .environment(\.editMode, self.$editMode)
        }
    }
    
    private var editButton: some View {
        Button(action: {
            self.editMode.toggle()
            self.selection = Set<UUID>()
        }) {
            Text(self.editMode.title)
        }
    }
    
    private var addDelButton: some View {
        if editMode == .inactive {
            return Button(action: onAdd) {
                Image(systemName: "plus")
            }
        } else {
            return Button(action: deleteItems) {
                Image(systemName: "trash")
            }
        }
    }
    
    private func onDelete(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
    
    private func onMove(source: IndexSet, destination: Int) {
        users.move(fromOffsets: source, toOffset: destination)
    }
    
    private func onAdd() {
        if name != "" {
            users.append(User(name: name))
            name = ""
        }
    }
    
    private func deleteItems() {
        for id in selection {
            if let index = users.lastIndex(where: { $0.id == id }) {
                users.remove(at: index)
            }
        }
        selection = Set<UUID>()
    }
}

struct EditingListView_Previews: PreviewProvider {
    static var previews: some View {
        EditingListView()
    }
}

struct User: Identifiable {
    let id = UUID()
    let name: String
}

extension EditMode {
    var title: String {
        self == .active ? "Done" : "Edit"
    }
    
    mutating func toggle() {
        self = self == .active ? .inactive : .active
    }
}
