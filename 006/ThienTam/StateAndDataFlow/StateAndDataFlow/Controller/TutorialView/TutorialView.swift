//
//  TutorialView.swift
//  StateAndDataFlow
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 19/06/2023.
//

import SwiftUI

struct TutorialView: View {
    
    @EnvironmentObject var appRouter: AppRouter
    @AppStorage("isRemoveTutorial") var isRemoveTutorial = false
    @ObservedObject var viewModel = TutorialViewModel()

    var body: some View {
        VStack {
            Image("bg_welcome")
                .resizable()
                .frame(height: UIScreen.main.bounds.height * 0.6)
                .overlay {
                    Image("ic_welcome")
                }
            
            Text("Hãy cố gắng trong mọi hoàn cảnh")
                .foregroundColor(Color("textDefault"))
            Text("Chúng tôi luôn quan tâm đến bạn")
                .foregroundColor(Color("textDefault"))
            
            Spacer()
            
            Button(action: {
                if viewModel.isCheckHaveUser() {
                    appRouter.state = .home
                } else {
                    appRouter.state = .login
                    isRemoveTutorial = true
                }
            }) {
                Text("GET STARTED")
                    .foregroundColor(Color("welcome"))
                    .font(.headline)
                    .frame(maxWidth: .infinity, maxHeight: 63)
                    .padding(.horizontal)
                    .background(Color("submitButton"))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.bottom, 36)
        }
        .ignoresSafeArea()
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
