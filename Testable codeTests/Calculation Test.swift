//
//  Calculation Test.swift
//  Testable codeTests
//
//  Created by Ray Nahimi on 23/12/2023.
//

import XCTest
@testable import Testable_code
final class Calculation_Test: XCTestCase {

    func testSuccessfulTipCalculation() {
        //Arragne
        let enteredAmount = 100.00
        let tipSlider = 25.00
        let calculation = Calculation()
        //Act
        let tip = calculation.calculateTip(of: enteredAmount, with: tipSlider)
        //Assert
        XCTAssertEqual(tip, 25 )
    }
    func testNegativeAmountCalculation() {
        //Arragne
        let enteredAmount = -100.00
        let tipSlider = 25.00
        let calculation = Calculation()
        //Act
        let tip = calculation.calculateTip(of: enteredAmount, with: tipSlider)
        //Assert
        XCTAssertNil(tip)
    }

}
