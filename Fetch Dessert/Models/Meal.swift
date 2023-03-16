//
//  Meal.swift
//  Fetch Dessert
//
//  Created by Jason Yeoh on 3/14/23.
//

import Foundation

struct Meal: Codable {
    let id: String
    let name: String
    let thumbnail: String
}

struct MealDetails {
    let name: String
    let instructions: String
    let ingredients: [Ingredient]
    
    init() {
        self.name = ""
        self.instructions = ""
        self.ingredients = []
    }
    
    init(name: String, instructions: String, ingredients: [Ingredient]) {
        self.name = name
        self.instructions = instructions
        self.ingredients = ingredients
    }
}

struct Ingredient: Hashable {
    let ingredient: String
    let measurement: String
}

struct MealData: Decodable {
    let meals: [[String: String?]]
}
