//
//  DessertTableViewCell.swift
//  Desserts - Search Engine
//
//  Created by Latheeshwarraj Mohanraj on 2/5/24.
//

import UIKit

class DessertTableViewCell: UITableViewCell {
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    public static let identifier = Constants.DESSERT_TABLE_VIEW_CELL_IDENTIFIER
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with recipe: Recipe) {
        titleLabel.text = recipe.strMeal
        subtitleLabel.text = "ID: \(recipe.idMeal)"
        recipeImageView.download(with: recipe.strMealThumb)
        
        addCustomStyles()
    }
    
    private func addCustomStyles() {
        // Rounded corners for recipe image
        recipeImageView.layer.cornerRadius = 10.0
        containerView.addShadow()
    }
}
