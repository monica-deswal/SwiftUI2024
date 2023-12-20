//
//  ViewController.swift
//  LearnSwiftUI
//
//  Created by Monica Deshwal on 20/12/23.
//

import UIKit

/*
 The property of an instance of a structure may be modified at any moment by different processes, such as in response to user interaction or events produced by the system. To inform an instance that one of its properties was modified, Swift introduces Property Observers.
 */
/*
 Property Observers are special methods, similar to get() and set(), that can be added to a property to execute code before and after a value is assigned to it.The methods are called willSet() and didSet(), and are declared between braces after the proeprty delaration.
 */

struct Price {
    
    var increment: Double = 0
    var oldPrice: Double = 0
    
    var price: Double {
        
        willSet {
            
            increment = newValue - price
        }
        didSet {
            
            oldPrice = oldValue
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //In this case the price is assigned with the new value and in didset we are extracting the old values.
        
        var product = Price(price: 15.95)
        product.price = 20.75
        
        print("New price: \(product.price)")
        print("Old price: \(product.oldPrice)")
    }


}

