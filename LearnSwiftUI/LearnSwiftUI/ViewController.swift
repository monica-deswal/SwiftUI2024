//
//  ViewController.swift
//  LearnSwiftUI
//
//  Created by Monica Deshwal on 20/12/23.
//

import UIKit
/*
 NSNumber(value: Value):- This initializer creates an NSNUmber object with the value specified by the value argument. The argument may be a value of any of the data type available in swift for numbers.
 1. IntValue: This property returns an int value with the object's number.
 2. floatValue:- This property returns a FloatValue with the object's number.
 3. doubleValue:- This property returns a Double value with the object's number.
 */
/*
 To format a number, we call this method from the instance with the styles we want to apply to it. The styles are defined by a structure that conforms to the format style protocol.
 formatted(FormatStyle) :- This method formats the number according to the styles provided by the argument.
 
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Working with NSNumber objects
        var myNumber = NSNumber(value: 35)
        var myDouble = myNumber.doubleValue * 2
        
        //formatting a number
        let formattedDoubleNumber: Double = 32.56789
        let outputFormattedNumber = formattedDoubleNumber.formatted(.number.precision(.fractionLength(2)))
        print(outputFormattedNumber)
        
        // rounding a number
        let roudingDoubleNumber: Double = 82.56789
        let outputRoundedNumber = roudingDoubleNumber.formatted(.number.precision(.fractionLength(2)).rounded(rule: .down))
        print(outputRoundedNumber)
        
        //disabling grouping
        let groupedNumber: Int = 32000000
        let groupedDisabledNumber = groupedNumber.formatted(.number.grouping(.never))
        print(groupedDisabledNumber)
        
        //adding the sign
        let addSignNumber: Int = 789457849
        let signedNumber = addSignNumber.formatted(.number.sign(strategy: .always(includingZero: false)))
        print(signedNumber)
        
        // adding a percent
        let percentNumber: Int = 32
        let percentageDisplayedNumber = percentNumber.formatted(.percent)
        print("the value of the percentage number \(percentageDisplayedNumber)")
        
        //formatting currency values
        let currencyNumber: Double = 32.55
        let currencyGeneratedNumber = currencyNumber.formatted(.currency(code: "CAD"))
        print(currencyGeneratedNumber)
    }


}

