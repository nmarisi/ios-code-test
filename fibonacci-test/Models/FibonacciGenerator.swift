//
//  FibonacciGenerator.swift
//  fibonacci-test
//
//  Created by Nahuel Marisi on 2016-02-22.
//  Copyright © 2016 TechBrewers. All rights reserved.
//

import Foundation

struct FibonacciGenerator: GeneratorType {
    private var numberOne: UInt = 0
    private var numberTwo: UInt = 0
    private var firstRun = true
    
    mutating func next() -> UInt? {
        
        if firstRun {
            firstRun = false
            return 0
        }
        
        if numberOne == 0 {
            numberOne = 1
            return numberOne
        }
        if numberOne == 1 && numberTwo == 0 {
            numberTwo = 1
            return numberTwo
        }
        
        // We need to add with overflow so we can stop when that happens
        let nextNumber = UInt.addWithOverflow(numberOne, numberTwo)
        if nextNumber.overflow {
            return nil
        }
        
        numberOne = numberTwo
        numberTwo = nextNumber.0
        return nextNumber.0
    }
}

extension FibonacciGenerator: SequenceType {
    func generate() -> FibonacciGenerator.Generator {
        return FibonacciGenerator()
    }
}