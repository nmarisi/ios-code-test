//
//  FibonacciTableViewCell.swift
//  fibonacci-test
//
//  Created by Nahuel Marisi on 2016-02-22.
//  Copyright © 2016 TechBrewers. All rights reserved.
//

import UIKit

class FibonacciTableViewCell: UITableViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    
    func configure(fibNumber: UInt) {
        numberLabel.text = "\(fibNumber)"
    }
    
   

}
