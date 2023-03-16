//
//  MealDetailView.swift
//  Fetch Dessert
//
//  Created by Jason Yeoh on 3/14/23.
//

import SwiftUI

struct MealDetailView: View {
    @ObservedObject private var viewModel = MealDetailViewModel()
    let meal: Meal
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: meal.thumbnail)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 250)
            .aspectRatio(contentMode: .fill)
            
            VStack(spacing: 20) {
                Text(viewModel.mealDetails.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Ingredients")
                        .font(.title3)
                        .bold()
                        
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(viewModel.mealDetails.ingredients, id:\.self) { ingredient in
                            Text("**\(ingredient.measurement)** \(ingredient.ingredient)")
                        }
                    }
                    
                    Text("Instructions")
                        .font(.title3)
                        .bold()
                    
                    NumberedTextView(text: viewModel.mealDetails.instructions)
                }
                Spacer()
            }.padding(.horizontal)
        }//end ScrollView(...)
        .ignoresSafeArea(.container)
        .onAppear {
            viewModel.fetchMealDetails(id: meal.id)
        }
    }
}
