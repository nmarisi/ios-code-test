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
    private let frequencyOfNewData = 20
    private var maxIndexPathReached = 0
   
    private var number: UInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the first 20 numbers in the sequence
        generateNextSet(30)
       
    }
    
    // MARK: - Helper methods
    
    func generateNextSet(upperBound: Int) {
        for _ in 0..<upperBound {
            /*
            guard let nextNumber =  sequence.next() else {
                return
            }
            generatedNumbers.append(nextNumber)
            */
            generatedNumbers.append(++number)
        }
    }
 

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return generatedNumbers.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row >= maxIndexPathReached {
            maxIndexPathReached++
        
            if maxIndexPathReached % frequencyOfNewData == 0 {
                generateNextSet(frequencyOfNewData)
                tableView.beginUpdates()
                
                for  i in indexPath.row..<indexPath.row+frequencyOfNewData {
                    tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: i, inSection: 0)], withRowAnimation: .Automatic)
                }
                tableView.endUpdates()
            }
        }

        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! FibonacciTableViewCell
        cell.configure(generatedNumbers[indexPath.row]);

        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
