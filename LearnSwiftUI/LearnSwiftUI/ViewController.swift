//
//  ViewController.swift
//  LearnSwiftUI
//
//  Created by Monica Deshwal on 20/12/23.
//

import UIKit

/**
 Blcoks of code, such as those used to create functions, conditionals and loops, have their own scope, and know the variables that are available to them. Beacause of this, we can generate independent processing unit that donot interfere with the oprations of other units. This feature is so important in computer programming that swift offers the possibility to create independent blcoks to take advantages of it.
 */

/*
 When we define the data type of a closure, we must declare the data types of the values it receives and the data type of the values. Therefore, if the closure doesn't return any value, we must declare the return type as Void.
 */
class ViewController: UIViewController {
    
    // Assigning a closure to variable
    let multiplier = { (number: Int, times: Int) -> Int in
        
        let total = number * times
        return total
        
    }
    
    //initializing a variable with the value returned by a closure
        // not receiving the value, just returning it
    let addition = { () -> Int in
        
        var total = 0
        var list = stride(from: 1, through:9, by: 1)
        
        for number in list {
            
            total += number
        }
        return total
    }()
    
    // When there is no param, infer the type of return
    let additionInferred: Int = {
        
        var total = 0
        var list = stride(from: 1, through: 9, by: 1)
        
        for number in list {
            
            total += number
        }
        return total
    }()
    
    //Sending a closure to a function
    func processClosure(myClosure: (Int, Int) -> Int) {
        
        let total = myClosure(10,2)
        print("the total is \(total)")
    }
    
    // If the function is declared outside of the function
    var myClosure: () -> Void = {}
    
    func passClosure(closure: @escaping () -> Void) {
        
        myClosure = closure
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("the result is \(multiplier(10, 5))")
        
        print("the total is \(addition)")
        
        print("Closure send inside a function = \(self.processClosure(myClosure: multiplier))")
        
        //assigning the closure to the function argument
        self.processClosure(myClosure: { (number: Int, times: Int) -> Int in
            return number * times
        })
        
        //trailing closure: when the last or the final argument of the call is a closure so we can use the trailing closure
        processClosure() { (number: Int, times: Int) -> Int in
            
            // no need of return
            number * times
        }
        
        //inferring the closure data types
        processClosure() { $0 * $1 }
        
        
        
       // declaring escaping closure
        passClosure() { () -> Void in
            
            print("clsure executed")
            
        }
        
        myClosure()
    }
    


}

