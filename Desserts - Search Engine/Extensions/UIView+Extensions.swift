//
//  UIView+Extensions.swift
//  Desserts - Search Engine
//
//  Created by Latheeshwarraj Mohanraj on 2/6/24.
//

import Foundation
import UIKit

extension UIView {
    func addShadow() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 6
        layer.cornerRadius = 10.0
    }
}
