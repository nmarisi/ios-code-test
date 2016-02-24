//
//  FibonacciTableViewController.swift
//  fibonacci-test
//
//  Created by Nahuel Marisi on 2016-02-22.
//  Copyright © 2016 TechBrewers. All rights reserved.
//

import UIKit

class FibonacciTableViewController: UITableViewController {
    
    private let reuseIdentifier = "FibonacciTableViewCell"
    private var sequence = GeneratorSequence(FibonacciGenerator())
    private var generatedNumbers  = [UInt]()

    private let initialNumberOfElements = 20 // Set the initial number of elements in the data source
    private let frequencyOfNewData = 10
    private var maxIndexPathReached = 0
   
    private var number: UInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the first 20 numbers in the sequence and update the maximum Index Path
        // currently on the tableView
        generateNextSet(initialNumberOfElements)
        maxIndexPathReached = initialNumberOfElements - 1
        
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return generatedNumbers.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! FibonacciTableViewCell
        cell.configure(generatedNumbers[indexPath.row]);

        return cell
    }
    
    // MARK: - ScrollView Delegate
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let currentPos = scrollView.contentOffset.y
        let height = scrollView.contentSize.height - tableView.frame.size.height
        if currentPos >= height {
            updateCotent()
        }
    }
    
    // MARK: - Helper methods
    func generateNextSet(upperBound: Int) -> Bool {
        for _ in 0..<upperBound {
            guard let nextNumber =  sequence.next() else {
                return false
            }
            generatedNumbers.append(nextNumber)
        }
        return true
        
    }
    func updateCotent() {
        
        guard generateNextSet(frequencyOfNewData) else {
            return
        }
        
        tableView.beginUpdates()
        for  i in maxIndexPathReached..<maxIndexPathReached+frequencyOfNewData {
            tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: i, inSection: 0)], withRowAnimation: .None)
        }
        tableView.endUpdates()
        maxIndexPathReached += frequencyOfNewData
    }
}
