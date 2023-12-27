//
//  ViewController.swift
//  LearnSwiftUI
//
//  Created by Monica Deshwal on 20/12/23.
//

import UIKit

enum Errors: Error {
    case OutOfStock
}

struct Stock {
    
    var totalLamps = 5
    mutating func sold(amount: Int) -> Result<Int, Errors> {
        
        if amount > totalLamps {
            return .failure(.OutOfStock)
        } else {
            totalLamps = totalLamps - amount
            return .success(totalLamps)
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var myStock = Stock()
        let result = myStock.sold(amount: 3)
        switch result {
            
        case .success(let stock):
            print("Lamps in stock: \(stock)")
        case .failure(let error):
            if error == .OutOfStock {
                print("Error: Out of stock")
            } else {
                print("Error")
            }
        }
        
        do {
            let stock = try result.get()
            print("Lamps in stock: \(stock)")
        } catch {
            
            print("Errors: Out of stock")
        }
    }

    

}

