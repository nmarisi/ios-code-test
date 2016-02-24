//
//  FibonacciTableViewController.swift
//  fibonacci-test
//
//  Created by Nahuel Marisi on 2016-02-24.
//  Copyright © 2016 TechBrewers. All rights reserved.
//

import UIKit

private let frequencyOfNewData = 10

final class FibonacciTableViewController: UITableViewController {
    
    private var maxIndexPathReached =  initialNumberOfElements - 1
    private let dataSource = FibonacciDataSource<FibonacciTableViewCell >(frequencyOfNewData: frequencyOfNewData)
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
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
    private func updateCotent() {
        
        guard dataSource.generateNextSet() else {
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
