//
//  AggregateListViewModel.swift
//  WorkingWithList
//
//  Created by Khuyen Dang T.T. VN.Danang on 25/04/2023.
//

import Foundation

final class AggregateListViewModel : ObservableObject {
    
    @Published var fruits = ["Avocado", "Apple", "Orange", "Banana", "Grape", "Grapefruit", "Starfruit", "Mango", "Pineapple", "Jackfruit", "Papaya", "Plum"]
    @Published var vegetables = ["Amaranth", "Bamboo shoot", "Cabbage", "Corn", "Polygonum", "Sweet potato bud", "Starfruit", "Tomato", "Water morning glory"]
    @Published var animals = ["Bear", "Elephant", "Fox", "Giraffe", "Jaguar", "Grapefruit", "Lion", "Squirrel", "Shark"]
    
    @Published var footerFruits = "Let's eat fruit together for beautiful skin 🍉🍌"
    @Published var footerVegetables = "Eat healthy vegetables 🥦🥕"
    @Published var footerAnimals = "Animals are my friends 🐒🦏"
}
