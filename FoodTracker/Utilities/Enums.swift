//
//  Enums.swift
//  FoodTracker
//
//  Created by Rylie Castell on 27.05.25.
//

import Foundation

enum EntryType: String, CaseIterable {
    case meal = "Mahlzeit"
    case drink = "Getränk"
    case snack = "Snack"
}

enum ViewSelection {
    case dashboard
    case entryList
    case profile
}

enum Sex {
    case male
    case female
}

enum ActivityLevel: String {
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

enum Weightgoal {
    case maintain
    case gain
    case lose
    
    var calorieGoalAdjustment: Double {
        switch self {
        case .maintain: 0.0
        case .gain: 10.0
        case .lose: -15.0
        }
    }
}

enum Diet: String {
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
