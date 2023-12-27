//
//  ViewController.swift
//  LearnSwiftUI
//
//  Created by Monica Deshwal on 20/12/23.
//

import UIKit

// Producing an error inside a method

enum Errors: Error {
    case OutOfStock
}
struct Stock {
    
    var totalLamps = 5
    mutating func sold(amount: Int) throws {
        
        if amount > totalLamps {
            throw Errors.OutOfStock
        } else {
            totalLamps = totalLamps - amount
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var myStock = Stock()
        
        try? myStock.sold(amount: 5)
        
        do {
            try myStock.sold(amount: 8)
        } catch {
            print("We do not have enough lamps")
        }
    }


}

