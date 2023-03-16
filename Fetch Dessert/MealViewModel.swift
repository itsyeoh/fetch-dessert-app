//
//  MealViewModel.swift
//  Fetch Dessert
//
//  Created by Jason Yeoh on 3/14/23.
//

import Foundation

class MealViewModel: ObservableObject {
    @Published var meals = [Meal]()
    
    // This function constructs a URL to fetch Dessert meals.
    func fetchMeals() {
        let URLString = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        guard let url = URL(string: URLString) else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(MealData.self, from: data)
                var meals = [Meal]()
                
                for meal in decodedData.meals {
                    let id = (meal["idMeal"] as? String) ?? ""
                    let name = (meal["strMeal"] as? String) ?? ""
                    let thumbnail = (meal["strMealThumb"] as? String) ?? ""
                    
                    meals.append(Meal(id: id, name: name, thumbnail: thumbnail))
                }
                
                DispatchQueue.main.async {
                    self.meals = meals
                }
            } catch {
                print("error: ", error)
            }
        }.resume()
    }
}
