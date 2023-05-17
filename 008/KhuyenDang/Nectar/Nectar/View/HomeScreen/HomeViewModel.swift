//
//  HomeViewModel.swift
//  Nectar
//
//  Created by Khuyen Dang T.T. VN.Danang on 10/05/2023.
//

import Foundation

class HomeViewModel: ObservableObject {

    @Published var exclusiveOffer: [FoodItem] = [
        FoodItem(name: "Organic Bananas", image: "https://images.pexels.com/photos/5945855/pexels-photo-5945855.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", quantity: "7pcs", price: 4.99),
        FoodItem(name: "Red Apple", image: "https://images.pexels.com/photos/102104/pexels-photo-102104.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", quantity: "1kg", price: 5.12),
        FoodItem(name: "Strawberry", image: "https://images.pexels.com/photos/4038803/pexels-photo-4038803.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", quantity: "0.5kg", price: 2.57),
        FoodItem(name: "Kiwi", image: "https://images.pexels.com/photos/54370/pexels-photo-54370.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", quantity: "1pcs", price: 1.01)
    ]
    
    @Published var bestSelling: [FoodItem] = [
        FoodItem(name: "Bell Pepper", image: "https://images.pexels.com/photos/132431/pexels-photo-132431.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", quantity: "1kg", price: 4.99),
        FoodItem(name: "Ginger", image: "https://images.pexels.com/photos/1337585/pexels-photo-1337585.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", quantity: "1kg", price: 2.12),
        FoodItem(name: "Lemon", image: "https://images.pexels.com/photos/1414110/pexels-photo-1414110.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", quantity: "0.5kg", price: 2.7),
    ]
}
