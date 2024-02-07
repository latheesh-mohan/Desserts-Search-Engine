//
//  ViewController.swift
//  Desserts - Search Engine
//
//  Created by Latheeshwarraj Mohanraj on 2/5/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var resultsCountLabel: UILabel!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var viewModel: RecipeViewModelProtocol = RecipeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyles()
        setupSearchViewController()
        setupTableView()
        loadData()
    }
    
    private func setupStyles() {
        self.navigationItem.title = Constants.SEARCH_TITLE
    }
    
    private func setupSearchViewController() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = Constants.SEARCH_BAR_PLACEHOLDER
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: DessertTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DessertTableViewCell.identifier)
        tableView.separatorStyle = .none
    }
    
    private func loadData() {
        viewModel.getRecipes { [weak self] in
            guard let self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.isSearching {
            resultsCountLabel.text = "\(viewModel.filteredRecipes.count) recipes found"
            return viewModel.filteredRecipes.count
        }
        resultsCountLabel.text = "\(viewModel.recipes.count) recipes found"
        return viewModel.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DessertTableViewCell.identifier, for: indexPath) as? DessertTableViewCell,
              let recipe = viewModel.getRecipe(at: indexPath.row) else { return UITableViewCell() }
        cell.configure(with: recipe)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let recipe = viewModel.getRecipe(at: indexPath.row) else { return }
        didSelectRecipe(with: recipe.idMeal)
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return}
        viewModel.searchText = searchText
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

extension ViewController: RecipeDetailViewControllerDelegate {
    func didSelectRecipe(with id: String) {
        guard let recipeDetailViewController = storyboard?.instantiateViewController(withIdentifier: Constants.RECIPE_DETAIL_VIEW_CONTROLLER_IDENTIFIER) as? RecipeDetailViewController,
              let navigationController = self.navigationController else { return }
        recipeDetailViewController.delegate = self
        recipeDetailViewController.loadRecipeDetails(for: id)
        navigationController.pushViewController(recipeDetailViewController, animated: true)
    }
}
