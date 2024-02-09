//
//  RecipeDetailViewController.swift
//  Desserts - Search Engine
//
//  Created by Latheeshwarraj Mohanraj on 2/6/24.
//

import UIKit

protocol RecipeDetailViewControllerDelegate: AnyObject {
    func didSelectRecipe(with id: String)
}

class RecipeDetailViewController: UIViewController {
    
    weak var delegate: RecipeDetailViewControllerDelegate?
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var recipeImageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tableViewPaddingTop: NSLayoutConstraint!
    
    var previousOffsetState: CGFloat = 0.0
    let viewModel = RecipeViewModel()
    var recipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: RecipeInfoTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: RecipeInfoTableViewCell.identifier)
        self.tableView.register(UINib(nibName: RecipeContentTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: RecipeContentTableViewCell.identifier)
        self.tableView.layer.cornerRadius = 20
    }
    
    func loadRecipeDetails(for id: String) {
        viewModel.getRecipeBy(id) {
            DispatchQueue.main.async { [weak self] in
                guard let self,
                      let thumbnailUrl = self.viewModel.currentRecipe?.strMealThumb else { return }
                recipeImageView.download(with: thumbnailUrl)
                self.tableView.reloadData()
            }
        }
    }
}

extension RecipeDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        switch index {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: RecipeInfoTableViewCell.identifier, for: indexPath) as? RecipeInfoTableViewCell {
                cell.configure(with: viewModel.currentRecipe)
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: RecipeContentTableViewCell.identifier, for: indexPath) as? RecipeContentTableViewCell {
                cell.configure(with: viewModel.currentRecipe, contentType: .ingredients)
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: RecipeContentTableViewCell.identifier, for: indexPath) as? RecipeContentTableViewCell {
                cell.configure(with: viewModel.currentRecipe, contentType: .instructions)
                return cell
            }
        default:
           break
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}


extension RecipeDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let screenHeight = AppUtilities.shared.getScreenHeight()
            let totalHeight = screenHeight - view.safeAreaInsets.top
            let offsetDiff = previousOffsetState - scrollView.contentOffset.y
            
            if scrollView.contentOffset.y > 300 {
                recipeImageViewHeight.constant = 0.0
            } else {
                let maxImageHeight: CGFloat = 300.0
                let minImageHeight: CGFloat = 0.0
                
                var newHeight = maxImageHeight - scrollView.contentOffset.y
                newHeight = max(minImageHeight, newHeight)
                recipeImageViewHeight.constant = newHeight
            }
        
            tableViewHeight.constant = totalHeight - recipeImageViewHeight.constant + 8.0
            
            if(recipeImageViewHeight.constant <= 0) {
                tableViewPaddingTop.constant = 8.0
            } else {
                tableViewPaddingTop.constant = -16.0
            }
            
            previousOffsetState = scrollView.contentOffset.y
        }
}
