//
//  ContentView.swift
//  Fetch Dessert
//
//  Created by Jason Yeoh on 3/14/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = MealViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.meals, id:\.id) { meal in
                NavigationLink(destination: MealDetailView(meal: meal)) {
                    Text(meal.name)
                }
            }.navigationTitle("Recipes")
        }.onAppear {
            viewModel.fetchMeals()
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
