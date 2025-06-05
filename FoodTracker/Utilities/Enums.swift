//
//  Enums.swift
//  FoodTracker
//
//  Created by Rylie Castell on 27.05.25.
//

import Foundation

enum EntryType: String, CaseIterable {
    case breakfast = "Frühstück"
    case lunch = "Mittagessen"
    case dinner = "Abendessen"
    case drink = "Getränk"
    case snack = "Snack"
}

enum ViewSelection {
    case dashboard
    case entryList
    case favorites
    case profile
}

enum Sex: String, CaseIterable {
    case male = "male"
    case female = "female"
}

enum ActivityLevel: String, CaseIterable {
    case veryLow = "kaum Bewegung"
    case low = "leicht aktiv"
    case medium = "mäßig aktiv"
    case high = "sehr aktiv"
    case veryHigh = "extrem aktiv"
    
    var activityFactor: Double {
        switch self {
        case .veryLow: 1.2
        case .low: 1.375
        case .medium: 1.55
        case .high: 1.725
        case .veryHigh: 1.9
        }
    }
}

enum WeightGoal: String, CaseIterable {
    case maintain = "Gewicht halten"
    case gain = "Gewicht zunehmen"
    case lose = "Gewicht verlieren"
    
    var calorieGoalAdjustment: Double {
        switch self {
        case .maintain: 0.0
        case .gain: 10.0
        case .lose: -15.0
        }
    }
}

enum Diet: String, CaseIterable {
    case omnivore = "Omnivor"
    case highProtein = "High Protein"
    case lowCarb = "Low Carb"
    case keto = "Keto"
    case lowFat = "Low Fat"
    case bodybuildingCutting = "Bodybuilding (Cutting)"
    case bodybuildingBulking = "Bodybuilding (Bulking)"
    case vegetarian = "Vegetarisch"
    case veganHighCarb = "Vegan (High Carb)"
    case veganRegular = "Vegan (Ausgewogen)"
    case paleo = "Paleo"
    
    var carbohydratePercentage: Double {
        switch self {
        case .omnivore, .bodybuildingBulking, .vegetarian, .veganRegular: 0.50
        case .highProtein: 0.35
        case .lowCarb: 0.25
        case .keto: 0.10
        case .lowFat, .veganHighCarb: 0.60
        case .bodybuildingCutting: 0.40
        case .paleo: 0.30
        }
    }
    var proteinPercentage: Double {
        switch self {
        case .omnivore, .keto, .lowFat, .veganHighCarb: 0.20
        case .highProtein: 0.35
        case .lowCarb, .bodybuildingBulking, .paleo: 0.30
        case .bodybuildingCutting: 0.40
        case .vegetarian, .veganRegular: 0.25
        }
    }
    var fatPercentage: Double {
        switch self {
        case .omnivore, .highProtein: 0.30
        case .lowCarb: 0.45
        case .keto: 0.70
        case .lowFat, .bodybuildingCutting, .bodybuildingBulking, .veganHighCarb: 0.20
        case .vegetarian, .veganRegular: 0.25
        case .paleo: 0.40
        }
    }
}

enum WeightCategory: String {
    case severeUnderweight = "Starkes Untergewicht"
    case moderateUnderweight = "Mäßiges Untergewicht"
    case mildUnderweight = "Leichtes Untergewicht"
    case normalWeight = "Normalgewicht"
    case overweight = "Präadipositas"
    case obesityClassI = "Adipositas Grad I"
    case obesityClassIi = "Adipositas Grad II"
    case obesityClassIii = "Adipositas Grad III"
}
