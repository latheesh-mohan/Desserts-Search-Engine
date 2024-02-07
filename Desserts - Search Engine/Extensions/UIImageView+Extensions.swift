//
//  UIImageView+Extensions.swift
//  Desserts - Search Engine
//
//  Created by Latheeshwarraj Mohanraj on 2/5/24.
//

import Foundation
import UIKit

extension UIImageView {
    func download(with imageURL: String?) {
        guard let imageURL,
              let url = URL(string: imageURL) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }
        task.resume()
    }
}
