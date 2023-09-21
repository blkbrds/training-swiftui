//
//  ExpandableListView.swift
//  Exercise7
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 20/09/2023.
//

import SwiftUI

struct ExpandableListView: View {

    var body: some View {
        NavigationView {
            List {
                Section {
                    OutlineGroup(MenuItem.items, children: \.subItems) { item in
                        HStack {
                            Image(systemName: item.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .frame(minWidth: 50, alignment: .leading)
                            Text(item.title)
                                .font(.headline)
                        }
                        .padding([.top, .bottom], 4)
                    }
                    .tint(.black)
                } header: {
                    HStack {
                        Image(systemName: "gearshape.2.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.black)
                        Text("Setting")
                            .frame(maxHeight: .infinity, alignment: .bottom)
                            .font(.system(size: 30, weight: .heavy, design: .monospaced))
                            .foregroundStyle(.black)
                            .textCase(nil)
                            .padding(.leading)
                    }
                    .padding(.bottom)
                }
            }
            .navigationTitle("Home control")
        }
    }
}

struct ExpandableListView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableListView()
    }
}
