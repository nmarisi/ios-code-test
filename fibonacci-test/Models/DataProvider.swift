//
//  DataProvider.swift
//  fibonacci-test
//
//  Created by Nahuel Marisi on 2016-02-24.
//  Copyright © 2016 TechBrewers. All rights reserved.
//

import Foundation

final class DataProvider {
    
    private var sequence = GeneratorSequence(FibonacciGenerator())
    
    var generatedNumbers: [UInt]
    
    init(initialNumberOfElements: Int) {
        generatedNumbers = [UInt]()
        generateNextSet(initialNumberOfElements)
    }
    
    
    /**
     Generate the next set of numbers in the fibonacci sequence
     
     - parameter upperBound: the position in the sequence that the generator should stop at
     
     - returns: returns true if sucessful, or false if it's not possible to generate more numbers
     */
    func generateNextSet(upperBound: Int) -> Bool {
        for _ in 0..<upperBound {
            guard let nextNumber =  sequence.next() else {
                return false
            }
            generatedNumbers.append(nextNumber)
        }
        return true
    }
}