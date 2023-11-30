//
//  Networking.swift
//  ConnectAPI
//
//  Created by Tu Le C. [2] VN.Danang on 19/06/2023.
//

import SwiftUI

struct Networking: View {
    
    @StateObject var viewModel = NetworkingViewModel(getApi: GetApiCocktailManager())
    
    var body: some View {
        ScrollView {
            VStack {
                Button {
                    viewModel.callApi(urlString: "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list")
                } label: {
                    Text("LoadApi")
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color(red: 0, green: 0, blue: 0.5))
                .clipShape(Capsule())
                
                VStack {
                    ForEach(viewModel.data.drinks, id: \.self) { item in
                        Text("\(item.ingredient)")
                            .frame(maxWidth: .infinity)
                        
                        Divider()
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct Networking_Previews: PreviewProvider {
    static var previews: some View {
        Networking()
    }
}
