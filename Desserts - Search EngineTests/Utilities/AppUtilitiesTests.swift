//
//  AppUtilitiesTests.swift
//  Desserts - Search EngineTests
//
//  Created by Latheeshwarraj Mohanraj on 2/6/24.
//

import XCTest
@testable import Desserts___Search_Engine

class AppUtilitiesTests: XCTestCase {
    func testGetInstructionsLabelText() {
        XCTAssertEqual(AppUtilities.shared.getInstructionsLabelText(from: nil), "")
        XCTAssertEqual(AppUtilities.shared.getInstructionsLabelText(from: ""), "")
        
        let instructionsRawString = "To make the pastry, measure the flour into a bowl and rub in the butter with your fingertips until the mixture resembles fine breadcrumbs. Add the water, mixing to form a soft dough.\r\nRoll out the dough on a lightly floured work surface and use to line a 20cm/8in flan tin. Leave in the fridge to chill for 30 minutes.\r\nPreheat the oven to 200C/400F/Gas 6 (180C fan).\r\nLine the pastry case with foil and fill with baking beans. Bake blind for about 15 minutes, then remove the beans and foil and cook for a further five minutes to dry out the base.\r\nFor the filing, spread the base of the flan generously with raspberry jam.\r\nMelt the butter in a pan, take off the heat and then stir in the sugar. Add ground almonds, egg and almond extract. Pour into the flan tin and sprinkle over the flaked almonds.\r\nBake for about 35 minutes. If the almonds seem to be browning too quickly, cover the tart loosely with foil to prevent them burning."
        
        let expectedString = """
        • To make the pastry, measure the flour into a bowl and rub in the butter with your fingertips until the mixture resembles fine breadcrumbs. Add the water, mixing to form a soft dough.
        • Roll out the dough on a lightly floured work surface and use to line a 20cm/8in flan tin. Leave in the fridge to chill for 30 minutes.
        • Preheat the oven to 200C/400F/Gas 6 (180C fan).
        • Line the pastry case with foil and fill with baking beans. Bake blind for about 15 minutes, then remove the beans and foil and cook for a further five minutes to dry out the base.
        • For the filing, spread the base of the flan generously with raspberry jam.
        • Melt the butter in a pan, take off the heat and then stir in the sugar. Add ground almonds, egg and almond extract. Pour into the flan tin and sprinkle over the flaked almonds.
        • Bake for about 35 minutes. If the almonds seem to be browning too quickly, cover the tart loosely with foil to prevent them burning.
        """
        
        XCTAssertEqual(AppUtilities.shared.getInstructionsLabelText(from: instructionsRawString), expectedString)
    }
    
    func testGetIngredientsLabelText() {
        let ingredients = ["Oil", "Salt", "Butter", "Eggs", "Plain Flour", "Almond Extract"]
        let measurements = ["1 tbsp", "1tsp", "1/4 cup", "5", "500g", "20ml"]
        
        let expectedString =
        """
        • Oil - 1 tbsp
        • Salt - 1tsp
        • Butter - 1/4 cup
        • Eggs - 5
        • Plain Flour - 500g
        • Almond Extract - 20ml
        
        """
        XCTAssertEqual(AppUtilities.shared.getIngredientsLabelText(ingredients: ingredients, measures: measurements), expectedString)
    }
}

