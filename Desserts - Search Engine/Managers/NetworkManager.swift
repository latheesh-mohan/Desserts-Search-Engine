//
//  NetworkManager.swift
//  Desserts - Search Engine
//
//  Created by Latheeshwarraj Mohanraj on 2/5/24.
//

import Foundation

class NetworkManager {
    static func fetchRecipes(completion: @escaping ([Recipe]?, String?) -> Void) {
        guard let url = URL(string: "\(Constants.BASE_URL)/filter.php?c=Dessert") else { return }
        let decoder = JSONDecoder()
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data, let dataModel = try? decoder.decode(Recipes.self, from: data){
                completion(dataModel.meals, nil)
            } else {
                completion(nil, Constants.ERROR_RETREIVAL_DATA)
            }
        }
        task.resume()
    }
    
    static func fetchRecipe(by id: String, completion: @escaping ([Recipe]?, String?) -> Void) {
        guard let url = URL(string: "\(Constants.BASE_URL)/lookup.php?i=\(id)") else { return }
        let decoder = JSONDecoder()
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data, let dataModel = try? decoder.decode(Recipes.self, from: data){
                completion(dataModel.meals, nil)
            } else {
                completion(nil, Constants.ERROR_RETREIVAL_DATA)
            }
        }
        task.resume()
    }
}
