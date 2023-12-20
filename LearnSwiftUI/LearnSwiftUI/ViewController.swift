//
//  ViewController.swift
//  LearnSwiftUI
//
//  Created by Monica Deshwal on 20/12/23.
//

import UIKit

/*
 The properties we have declared up to this point are called stored properties. Their function is to store a value in memory. But there are other types of properties called Computed Properties. These properties do not store a value of their own, instead they have access to the rest of the properties of the structure and perform the operation to set and retreive their values.
 */

struct Price {
    
    var USD: Double
    var rateToCAD: Double
    
    var canadians: Double {
        
        get {
            return USD * rateToCAD
        }
    }
}

struct PriceStruct {
    
    var USD: Double
    var rateToCAD: Double
    var rateTOUSD: Double
    
    var canadians: Double {
        
        get {
            USD * rateToCAD
        }
        set {
            USD = newValue * rateToCAD
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var purchase = Price(USD: 11, rateToCAD: 1.29)
        print("Price in CAD: \(purchase.canadians)")
        
        var purchaseStruct = PriceStruct(USD: 11, rateToCAD: 1.29, rateTOUSD: 0.77)
        
    }


}

