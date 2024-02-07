//
//  RecipeInstructionsTableViewCell.swift
//  Desserts - Search Engine
//
//  Created by Latheeshwarraj Mohanraj on 2/6/24.
//

import UIKit

enum RecipeContentType: String {
    case instructions = "Instructions"
    case ingredients = "Ingredients"
}

class RecipeContentTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    public static let identifier = Constants.RECIPE_CONTENT_TABLE_VIEW_CELL_IDENTIFIER
    
    func configure(with recipe: Recipe?, contentType: RecipeContentType) {
        titleLabel.text = contentType.rawValue
        
        guard let recipe else { return }
        
        if contentType == .instructions {
            let instructionsText = AppUtilities.shared.getInstructionsLabelText(from: recipe.strInstructions)
            subtitleLabel.text = instructionsText
        } else {
            let ingredientsText = AppUtilities.shared.getIngredientsLabelText(ingredients: recipe.ingredients, measures: recipe.measures)
            subtitleLabel.text = ingredientsText
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
