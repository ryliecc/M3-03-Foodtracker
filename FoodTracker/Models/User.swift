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
    var weightCategory: WeightCategory {
        switch bmi {
        case 0..<16.0: return .severeUnderweight
        case 16.0..<17.0: return .moderateUnderweight
        case 17.0..<18.5: return .mildUnderweight
        case 18.5..<25.0: return .normalWeight
        case 25.0..<30.0: return .overweight
        case 30.0..<35.0: return .obesityClassI
        case 35.0..<40.0: return .obesityClassIi
        default: return .obesityClassIii
        }
    }
    var bmr: Int {
        switch sex {
        case .male: Int(weightInKilogram * 24)
        case .female: Int(weightInKilogram * 24 * 0.9)
        }
    }
    
    var activityLevel: ActivityLevel
    var weightGoal: WeightGoal
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
