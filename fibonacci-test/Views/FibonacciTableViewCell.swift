//
//  FibonacciTableViewCell.swift
//  fibonacci-test
//
//  Created by Nahuel Marisi on 2016-02-24.
//  Copyright © 2016 TechBrewers. All rights reserved.
//

import UIKit

protocol ConfigurableCell {
    
    typealias DataObject
    
    func configureWithObject(object: DataObject)
    static func reuseIdentifier() -> String 
}

class FibonacciTableViewCell: UITableViewCell, ConfigurableCell {

    @IBOutlet weak var numberLabel: UILabel!
    
    func configureWithObject(object: UInt) {
        numberLabel.text = "\(object)"
    }
    
    static func reuseIdentifier() -> String {
        return "FibonacciTableViewCell"
    }
    
   

}
