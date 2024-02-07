//
//  RecipeDetailViewController.swift
//  Desserts - Search EngineTests
//
//  Created by Latheeshwarraj Mohanraj on 2/6/24.
//

import XCTest
@testable import Desserts___Search_Engine

class RecipeDetailViewControllerTests: XCTestCase {
    
    var viewController: RecipeDetailViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "RecipeDetailViewController") as? RecipeDetailViewController
        viewController.loadViewIfNeeded()
    }
    
    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
    
    func testSetupStyles() {
        viewController.viewDidLoad()
        XCTAssertEqual(viewController.navigationItem.title, Constants.RECIPE_DETAILS_TITLE)
    }
}
