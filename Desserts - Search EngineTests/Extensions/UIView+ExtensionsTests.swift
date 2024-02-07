//
//  UIView+ExtensionsTests.swift
//  Desserts - Search EngineTests
//
//  Created by Latheeshwarraj Mohanraj on 2/6/24.
//

import XCTest
@testable import Desserts___Search_Engine

class UIViewExtensionsTests: XCTestCase {
    func testAddShadow() {
        let view = UIView()
        view.addShadow()
        
        let layer = view.layer
        XCTAssertEqual(layer.shadowColor, UIColor.gray.cgColor)
        XCTAssertEqual(layer.shadowOpacity, 0.3)
        XCTAssertEqual(layer.shadowRadius, 6)
        XCTAssertEqual(layer.cornerRadius, 10.0)
    }
}
