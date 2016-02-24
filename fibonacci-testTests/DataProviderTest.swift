//
//  DataProviderTest.swift
//  fibonacci-test
//
//  Created by Nahuel Marisi on 2016-02-24.
//  Copyright © 2016 TechBrewers. All rights reserved.
//

import XCTest
@testable import fibonacci_test

class DataProviderTest: XCTestCase {

    let dataProvider = DataProvider(initialNumberOfElements: initialNumberOfElements)
    var generateNumbers: [UInt]?

    func testDataGeneration() {
       
        let upperBound = Int(arc4random_uniform(50))
        dataProvider.generateNextSet(upperBound)
        
        XCTAssert(dataProvider.generatedNumbers.count == (initialNumberOfElements + upperBound),
            "Generated numbers count is different to requested number")
    }
}
