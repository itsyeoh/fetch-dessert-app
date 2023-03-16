//
//  MealDetailViewModel.swift
//  Fetch Dessert
//
//  Created by Jason Yeoh on 3/15/23.
//

import Foundation

class MealDetailViewModel: ObservableObject {
    @Published var mealDetails = MealDetails()
    
    // This function takes an id parameter and constructs a URL to fetch meal details.
    func fetchMealDetails(id: String) {
        let URLString = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
        guard let url = URL(string: URLString) else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(MealData.self, from: data)
                var currentMealDetails = MealDetails()
                
                for meal in decodedData.meals {
                    let name = (meal["strMeal"] as? String) ?? ""
                    let instructions = (meal["strInstructions"] as? String) ?? ""
                    var ingredients: [Ingredient] = []
                    var index = 1

                    while true {
                        guard let ingredient = meal["strIngredient\(index)"] as? String,
                              let measure = meal["strMeasure\(index)"] as? String,
                              !ingredient.isEmpty, // check if ingredient is empty
                              !measure.isEmpty // check if measurement is empty
                        else { break }

                        ingredients.append(Ingredient(ingredient: ingredient.lowercased(), measurement: measure))
                        index += 1
                    }
                    currentMealDetails = MealDetails(name: name,
                                                     instructions: instructions,
                                                     ingredients: ingredients)
                }
                
                DispatchQueue.main.async {
                    self.mealDetails = currentMealDetails
                }
            } catch {
                print("error: ", error)
            }
        }.resume()
    }
}

