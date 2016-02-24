//
//  FibonacciDataSource.swift
//  fibonacci-test
//
//  Created by Nahuel Marisi on 2016-02-24.
//  Copyright © 2016 TechBrewers. All rights reserved.
//

import UIKit

let initialNumberOfElements = 20 // Set the initial number of elements in the data source

final class FibonacciDataSource<CellType: UITableViewCell where CellType: ConfigurableCell, CellType.DataObject == UInt>: NSObject, UITableViewDataSource {
    
    private let frequencyOfNewData: Int
    private let dataProvider = DataProvider(initialNumberOfElements: initialNumberOfElements)
 
    init(frequencyOfNewData: Int) {
        self.frequencyOfNewData = frequencyOfNewData
        super.init()
    }
    
    /**
     Generate the next batch of numbers in the fibonacci sequence.
     
     - returns: True if succesful
     */
    func generateNextSet() -> Bool {
        guard dataProvider.generateNextSet(frequencyOfNewData) else {
            return false
        }
        return true
    }
    
    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider.generatedNumbers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->  UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCellWithIdentifier(CellType.reuseIdentifier(), forIndexPath: indexPath) as? CellType else{
            fatalError("Unable to instantiate cell of type \(CellType.self)")
        }

        let generatedNumber: UInt = dataProvider.generatedNumbers[indexPath.row]
        cell.configureWithObject(generatedNumber)
        
        return cell
    }
    
}