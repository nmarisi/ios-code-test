//
//  FibonacciGeneratorTests.swift
//  fibonacci-test
//
//  Created by Nahuel Marisi on 2016-02-24.
//  Copyright © 2016 TechBrewers. All rights reserved.
//

import XCTest
@testable import fibonacci_test

class FibonacciGeneratorTests: XCTestCase {
   
    private var sequence: GeneratorSequence<FibonacciGenerator>?
    
    override func setUp() {
        super.setUp()
        sequence = GeneratorSequence(FibonacciGenerator())
    }
    
    func testGenerateUntilUIntMax() {
        
        guard let seq = sequence else {
            XCTAssert(false, "Failed to obtain a generated sequence")
            return
        }
        
        var lastGenNumber: UInt?
        for nextNumber in seq {
            lastGenNumber = nextNumber
        }
        
        XCTAssert(lastGenNumber != nil, "Last number generated is nil")
        XCTAssert(lastGenNumber <= UInt.max, "Generated Number went beyond UInt.max")
    }
    
    func testValidityOfGenerator() {
        
        guard let seq = sequence else {
            XCTAssert(false, "Failed to obtain a generated sequence")
            return
        }
        
        var sequenceArray = [UInt]()
        for number in seq {
            sequenceArray.append(number)
        }
        
        // Run the following code inside a measure block so it's tested various times
        // with different numbers in the sequence
        self.measureBlock {
            // pick a generated number at random
            let randomNumber = Int(arc4random_uniform(UInt32(sequenceArray.count)))
            
            // If it's one of the first two numbers in the sequence, we check that
            // the number and the next one add to the one after those two, to avoid
            // accessing an array index that's less than 0
            if randomNumber < 2 {
                XCTAssert(sequenceArray[randomNumber + 2] == (
                    sequenceArray[randomNumber] + sequenceArray[randomNumber + 1]))
            } else {
                XCTAssert(sequenceArray[randomNumber] == (
                    sequenceArray[randomNumber - 1] + sequenceArray[randomNumber - 2]))
            }
        }
        
        
        
    }
    
    
}
