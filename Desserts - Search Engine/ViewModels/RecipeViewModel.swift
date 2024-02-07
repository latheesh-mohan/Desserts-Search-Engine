//
//  RecipeViewModel.swift
//  Desserts - Search Engine
//
//  Created by Latheeshwarraj Mohanraj on 2/5/24.
//

import Foundation

protocol RecipeViewModelProtocol {
    var recipes: [Recipe] { get }
    var filteredRecipes: [Recipe] { get }
    var isSearching: Bool { get set }
    var searchText: String { get set }
    func getRecipes(completion: @escaping () -> Void)
    func getRecipe(at index: Int) -> Recipe?
}

class RecipeViewModel: RecipeViewModelProtocol {
    var isSearching = false
    var recipes: [Recipe] = []
    var filteredRecipes: [Recipe] = []
    var currentRecipe: Recipe? = nil
    var searchText: String = "" {
        didSet {
            filteredRecipes = recipes.filter({ recipe in
                return recipe.idMeal.starts(with: searchText) || recipe.strMeal.starts(with: searchText)
            })
            isSearching = searchText.count > 0
        }
    }
    
    func getRecipes(completion: @escaping () -> Void) {
        NetworkManager.fetchRecipes { recipes, error in
            guard let recipes else { 
                print(Constants.ERROR_RETREIVAL_DATA)
                return
            }
            self.recipes = recipes
            completion()
        }
    }
    
    func getRecipeBy(_ id: String, completion: @escaping () -> Void) {
        NetworkManager.fetchRecipe(by: id) { recipes, string in
            guard let recipes,
                  let recipe = recipes.first else {
                print(Constants.ERROR_RETREIVAL_DATA)
                return
            }
            self.currentRecipe = recipe
            completion()
        }
    }
    
    func getRecipe(at index: Int) -> Recipe? {
        if isSearching,
           index < filteredRecipes.count {
            return filteredRecipes[index]
        } else if index < recipes.count {
            return recipes[index]
        }
        return nil
    }
}
