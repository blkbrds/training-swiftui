//
//  TutorialView.swift
//  StateAndDataFlow
//
//  Created by Tu Le C. [2] VN.Danang on 11/04/2023.
//

import SwiftUI

struct TutorialView: View {
    
    @State private var pageIndex = 0
    @EnvironmentObject var appRouter: StorageData
    @StateObject var viewModel = TutorialViewModel()
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        TabView(selection: $pageIndex) {
            ForEach(viewModel.pages) { page in
                VStack {
                    Spacer()
                    PageView(page: page)
                    Spacer()
                    if viewModel.handlePage(page: page) {
                        Button("Login!", action: goToLogin)
                            .buttonStyle(.bordered)
                    } else {
                        Button("next", action: incrementPage)
                            .buttonStyle(.borderedProminent)
                    }
                    Spacer()
                }
                .tag(page.tag)
            }
        }
        .animation(.easeInOut, value: pageIndex)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .tabViewStyle(PageTabViewStyle())
        .onAppear {
            dotAppearance.currentPageIndicatorTintColor = .black
            dotAppearance.pageIndicatorTintColor = .gray
        }
    }
    
    func incrementPage() {
        pageIndex += 1
    }
    
    func goToLogin() {
        appRouter.appState = .login
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
