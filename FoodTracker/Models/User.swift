//
//  User.swift
//  FoodTracker
//
//  Created by Rylie Castell on 30.05.25.
//

import Foundation

struct User {
    var name: String
    var sex: Sex
    var heightInMeter: Double
    var weightInKilogram: Double
    
    var activityLevel: ActivityLevel
    var weightGoal: WeightGoal
    var calorieGoal: Int
    
    var diet: Diet
    var carbohydrateInGramGoal: Double
    var proteinInGramGoal: Double
    var fatInGramGoal: Double
}
