//
//  AppUtilities.swift
//  Desserts - Search Engine
//
//  Created by Latheeshwarraj Mohanraj on 2/6/24.
//

import Foundation
import UIKit

class AppUtilities {
    static let shared = AppUtilities()
    private init() { }
    
    func getInstructionsLabelText(from instructions: String?) -> String {
        guard let instructions,
              !instructions.isEmpty else {
            return ""
        }
        let steps = instructions.components(separatedBy: "\r\n")
        let nonEmptySteps = steps.filter { step in
            return step.count > 0
        }
        let combinedString = nonEmptySteps.map { "• \($0)" }.joined(separator: "\n")
        return combinedString
    }
    
    func getIngredientsLabelText(ingredients: [String], measures: [String]) -> String {
        var result = ""
        
        for (ingredient, measure) in zip(ingredients, measures) {
            if !ingredient.isEmpty {
                if !measure.isEmpty {
                    let formattedPair = "• \(ingredient) - \(measure)"
                    result += formattedPair + "\n"
                } else {
                    result += "• \(ingredient)\n"
                }
            }
        }
        return result
    }
    
    func getScreenHeight() -> CGFloat {
        let screenRect = UIScreen.main.bounds
        let screenHeight = screenRect.size.height
        return screenHeight
    }
}
