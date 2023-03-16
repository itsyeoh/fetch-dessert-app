# Fetch Dessert App

Author: **Jason Yeoh** (jasonayeoh@gmail.com)

### Overview
This is an iOS app called "Fetch Dessert" which fetches and displays dessert recipes from an API called themealdb.com. It has two views - a list view that displays the names of the desserts, and a detail view that displays the name, image, instructions and ingredients of the selected dessert.

### Files
- **Meal.swift**: This file defines the Meal, MealData, and MealDetail models. MealData struct is used to decode the data from the API.
- **MealViewModel.swift**: This file defines the MealViewModel class, which is responsible for fetching the dessert meals from the API and storing them in an array. It also has a function fetchMeals() which constructs a URL to fetch dessert meals and calls an API to get the data.
- **MealDetailViewModel.swift**: This file defines the MealDetailViewModel class, which is responsible for fetching the details of a selected dessert meal from the API and storing them in a MealDetails struct. It has a function fetchMealDetails(id:) which takes an id parameter and constructs a URL to fetch meal details and calls an API to get the data.
- **ContentView.swift**: This file defines the main view of the app. It displays the list of dessert meals and uses the MealViewModel to fetch and display the meals. It also has a NavigationLink which navigates to the detail view when a meal is selected.
- **MealDetailView.swift**: This file displays the details of the selected dessert meal. It uses the MealDetailViewModel to fetch and display the details of the meal.

### Packages Used
- SwiftUI
- Foundation

### API
- This app uses the MealDB API to fetch dessert meals and their details. It has two endpoints:
  - https://themealdb.com/api/json/v1/1/filter.php?c=Dessert: This endpoint fetches dessert meals.
  - https://themealdb.com/api/json/v1/1/lookup.php?i={meal_id}: This endpoint fetches the details of a specific meal, where {meal_id} is the id of the meal.

### Installation
1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Build and run the project.

### Usage
1. Launch the app.
2. You will see a list of dessert meals.
3. Tap on a meal to see its details.
4. You will see the name, image, instructions and ingredients of the selected meal.
