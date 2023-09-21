//
//  EditingModeViewModel.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 21/09/2023.
//

import Foundation
import SwiftUI

class EditingModeViewModel: ObservableObject {

    @Published var shouldShowAddAlert: Bool = false
    @Published var heroName: String = ""
    @Published var editMode: EditMode = .inactive
    @Published var heros: [Hero] = []
    @Published var selection: Set<UUID> = .init()

    private let localStorage = LocalStorage()

    func getHeros() {
        guard let heros = localStorage.heros, !heros.isEmpty else {
            self.heros = Hero.heros
            return
        }
        self.heros = heros
    }

    func delete(at offsets: IndexSet) {
        heros.remove(atOffsets: offsets)
    }

    func move(source: IndexSet, destination: Int) {
        heros.move(fromOffsets: source, toOffset: destination)
    }

    func add() {
        if !heroName.isEmpty {
            heros.append(.init(name: heroName))
            heroName = ""
            localStorage.saveHeros(heros: heros)
        }
    }

    func deleteSelected() {
        for id in selection {
            if let index = heros.firstIndex(where: { $0.id == id }) {
                heros.remove(at: index)
            }
        }
        selection = .init()
        localStorage.saveHeros(heros: heros)
    }
}
