//
//  HomeView.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 08/05/2023.
//

import SwiftUI

struct HomeView: View {

    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Image("carrot")
                    .resizable()
                    .frame(width: 30, height: 30)
                HStack {
                    Image(systemName: "location.fill")
                        .foregroundColor(.gray)
                    Text("Son Tra, Da Nang")
                }
                    .font(.system(size: 22))
                List {
                    SectionAds()
                    SectionFood(foodItems: viewModel.exclusiveOffer, titleSection: "Exclusive Offer")
                    SectionFood(foodItems: viewModel.bestSelling, titleSection: "Best Selling")
                }
                    .listStyle(.plain)
                    .scrollIndicators(.hidden)
            }
                .onAppear {
                UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color("green"))
                UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color("green").opacity(0.2))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
