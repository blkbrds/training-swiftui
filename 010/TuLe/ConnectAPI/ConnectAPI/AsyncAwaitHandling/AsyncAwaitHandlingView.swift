//
//  AsyncAwaitHandlingView.swift
//  ConnectAPI
//
//  Created by Tu Le C. [2] VN.Danang on 05/07/2023.
//

import SwiftUI

struct AsyncAwaitHandlingView: View {

    @State var gridLayout: [GridItem] = [GridItem()]
    @StateObject var viewModel = AsyncAwaitHandlingViewModel(getApi: APIAsyncAwaitManager())
    internal var didAppear: ((Self) -> Void)?

    var body: some View {
        ScrollView {
            Button {
                Task {
                    await viewModel.callApi(urlString: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?g=Cocktail_glass")
                }
            } label: {
                Text("LoadApi")
                    .foregroundColor(.white)
            }
            .onAppear {
                self.didAppear?(self)
            }
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .clipShape(Capsule())

            LazyVGrid(columns: gridLayout) {
                ForEach(viewModel.data.cocktail, id: \.self) { element in
                    HStack {
                        Text("\(element.strDrink)")
                            .accessibilityIdentifier("item")
                    }
                    Divider()
                }
            }
            .padding(.all, 10)
            .frame(maxWidth: .infinity)
            .animation(.interactiveSpring(), value: gridLayout.count)
            .accessibilityIdentifier("myGrid")
        }
    }
}

struct AsyncAwaitHandlingView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncAwaitHandlingView()
    }
}
