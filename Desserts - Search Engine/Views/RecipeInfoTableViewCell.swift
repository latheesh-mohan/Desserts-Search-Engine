//
//  RecipeInfoTableViewCell.swift
//  Desserts - Search Engine
//
//  Created by Latheeshwarraj Mohanraj on 2/6/24.
//

import UIKit

class RecipeInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var ingredientsView: UIView!
    @IBOutlet weak var difficultyView: UIView!
    @IBOutlet weak var ingredientsCountLabel: UILabel!
    public static let identifier = Constants.RECIPE_INFO_TABLE_VIEW_CELL_IDENTIFIER
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with recipe: Recipe?) {
        if let title = recipe?.strMeal {
            titleLabel.text = title
        }
        if let ingredientsCount = recipe?.ingredients.count {
            ingredientsCountLabel.text = "\(ingredientsCount)"
        }
        addCustomStyles()
    }
    
    private func addCustomStyles() {
        // Add rounded corners and shadow effect
        [timeView, ingredientsView, difficultyView].forEach { view in
            view.layer.cornerRadius = 10.0
            view.addShadow()
        }
    }
    
}
