//
//  ConstantsTests.swift
//  Desserts - Search EngineTests
//
//  Created by Latheeshwarraj Mohanraj on 2/6/24.
//

import XCTest
@testable import Desserts___Search_Engine

class ConstantsTests: XCTestCase {
    func testConstants() {
        XCTAssertEqual(Constants.BASE_URL, "https://themealdb.com/api/json/v1/1")
        XCTAssertEqual(Constants.DESSERT_TABLE_VIEW_CELL_IDENTIFIER, "DessertTableViewCell")
        XCTAssertEqual(Constants.RECIPE_INFO_TABLE_VIEW_CELL_IDENTIFIER, "RecipeInfoTableViewCell")
        XCTAssertEqual(Constants.RECIPE_CONTENT_TABLE_VIEW_CELL_IDENTIFIER, "RecipeContentTableViewCell")
        XCTAssertEqual(Constants.RECIPE_DETAIL_VIEW_CONTROLLER_IDENTIFIER, "RecipeDetailViewController")
        XCTAssertEqual(Constants.SEARCH_TITLE, "Search")
        XCTAssertEqual(Constants.SEARCH_BAR_PLACEHOLDER, "Blueberry Muffins...")
        XCTAssertEqual(Constants.ERROR_RETREIVAL_DATA, "Error retreiving data.")
    }
}
