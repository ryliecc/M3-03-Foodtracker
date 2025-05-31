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
    
    var bmi: Double { weightInKilogram / pow(heightInMeter, 2) }
    var bmr: Int {
        switch sex {
        case .male: Int(weightInKilogram * 24)
        case .female: Int(weightInKilogram * 24 * 0.9)
        }
    }
    
    var activityLevel: ActivityLevel
    var weightGoal: Weightgoal
    var calorieGoal: Int {
        let calorieRequirement: Int = Int(Double(bmr) * activityLevel.activityFactor)
        let goalAdjustment: Int = Int(Double(calorieRequirement) / 100 * weightGoal.calorieGoalAdjustment)
        return calorieRequirement + goalAdjustment
    }
    
    var diet: Diet
    var carbohydrateInGramGoal: Double {
        (Double(calorieGoal) * diet.carbohydratePercentage) / 4
    }
    var proteinInGramGoal: Double {
        (Double(calorieGoal) * diet.proteinPercentage) / 4
    }
    var fatInGramGoal: Double {
        (Double(calorieGoal) * diet.fatPercentage) / 9
    }
}
