//
//  PageView.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 12/04/2023.
//

import SwiftUI

struct PageView: View {
    
    var page: TutorialModel
    
    var body: some View {
        VStack(spacing: 10) {
            Image("\(page.imageUrl)")
                .resizable()
                .scaledToFit()
                .padding()
                .cornerRadius(30)
                .background(.gray.opacity(0.10))
                .cornerRadius(10)
                .padding()
            
            Text(page.name)
                .font(.title)
            Text(page.description)
                .font(.subheadline)
                .frame(width: 300)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(page: TutorialModel.samplePage)
    }
}
