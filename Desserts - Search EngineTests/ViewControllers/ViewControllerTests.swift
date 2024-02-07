//
//  ViewControllerTests.swift
//  Desserts - Search EngineTests
//
//  Created by Latheeshwarraj Mohanraj on 2/6/24.
//

import XCTest
@testable import Desserts___Search_Engine

class MockRecipeViewModel: RecipeViewModel {
    var isGetRecipesCalled = false
    
    override func getRecipes(completion: @escaping () -> Void) {
        isGetRecipesCalled = true
        completion()
    }
}


class ViewControllerTests: XCTestCase {
    
    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        viewController.loadViewIfNeeded()
    }
    
    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
    
    func testSetupStyles() {
        viewController.viewDidLoad()
        XCTAssertEqual(viewController.navigationItem.title, Constants.SEARCH_TITLE)
    }
    
    func testSetupSearchViewController() {
        viewController.viewDidLoad()
        XCTAssertNotNil(viewController.searchController.searchResultsUpdater)
        XCTAssertEqual(viewController.searchController.searchBar.placeholder, Constants.SEARCH_BAR_PLACEHOLDER)
    }
    
    func testLoadData() {
        let mockViewModel = MockRecipeViewModel()
        viewController.viewModel = mockViewModel
        viewController.viewDidLoad()
        XCTAssertTrue(mockViewModel.isGetRecipesCalled)
    }
}
