//
//  CustomRowsListView.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 18/09/2023.
//

import SwiftUI

struct CustomRowsListView: View {

    var body: some View {
        NavigationView {
            List {
                ForEach(Person.persons, id: \.id) { person in
                    PersonCell(person: person)
                }
            }
            .navigationTitle("Persons")
        }
    }
}

struct CustomRowsListView_Previews: PreviewProvider {
    static var previews: some View {
        CustomRowsListView()
    }
}
