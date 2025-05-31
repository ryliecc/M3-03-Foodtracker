//
//  Extensions.swift
//  FoodTracker
//
//  Created by Rylie Castell on 28.05.25.
//

import Foundation

extension Double {
    var formattedGrams: String {
        if self.truncatingRemainder(dividingBy: 1) == 0 {
            return "\(Int(self)) g"
        } else {
            return String(format: "%.1f g", self)
        }
    }
    
    var formattedMeters: String {
        if self.truncatingRemainder(dividingBy: 1) == 0 {
            return "\(Int(self)) m"
        } else {
            return String(format: "%.2f m", self)
        }
    }
    
    var formattedKilograms: String {
        if self.truncatingRemainder(dividingBy: 1) == 0 {
            return "\(Int(self)) kg"
        } else {
            return String(format: "%.1f kg", self)
        }
    }
}
