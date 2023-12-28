//
//  ViewController.swift
//  LearnSwiftUI
//
//  Created by Monica Deshwal on 20/12/23.
//

import UIKit

/*
 Property Wrappers: Property Wrappers are a tool provided by the swift language that allows us to encapsulate functionality in a property. They are like computed proeprty, but applicable to multiple properties. As other swift features, they are designed to simplify our code.
 A property wrapper is just a structure, but it must be proceded by the @propertyWrapper keyword and include a property with the name wrapped value to process and store the value. The strucuture must also include an initializer for the wrappedValue property.
 */

@propertyWrapper
struct ClampedValue {
    
    var storedValue: Int = 0
    var min: Int = 0
    var max: Int = 0
    
    var wrappedValue: Int {
        
        get {
            return storedValue
        } set {
            
            if newValue < min {
                storedValue = min
            } else if newValue > max {
                storedValue = max
            } else {
                storedValue = newValue
            }
        }
    }
    init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue
    }
}

struct Price {
    
    @ClampedValue var firstPrice: Int
    @ClampedValue var secondPrice: Int
    
    func printMessage() {
        print("First Price: \(firstPrice)")
        print("Second Price: \(secondPrice)")
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var purchase = Price(firstPrice: -42, secondPrice: 255)
        purchase.printMessage()
    }


}

