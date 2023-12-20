//
//  ViewController.swift
//  LearnSwiftUI
//
//  Created by Monica Deshwal on 20/12/23.
//

import UIKit

/*
 Although we can send any value of any type we want to a generic function, the operation we can perform on them are very limited due to the impossibility of the compiler to know the nature of the values received. For example, we can add two integers, but we cannot add two boolean values. To solve these issues, we can constrain the generic data types with protocols.
 */
/*
 Generic data types are not exclusive to functions, we can also turn data types themselves, such as strucutres, into generic types. The advantage is that we can create independent processing units that can handle differnt type of values. To create a generic strucutre, we must declare the generic data types after the name of the structureand between angle brackets, as we did for functions.
 */

struct MyStructure<T> {
    
    var myValue: T
    
    func description() {
        
        print("The value is \(myValue)")
    }
}

class ViewController: UIViewController {

    //defining generic functions
    func getDescription<T>(value: T) -> String {
        
        let message = "The value is \(value)"
        return message
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let result = getDescription(value: 3.5)
        let result2 = getDescription(value: "Steve")
        
        let instance = MyStructure(myValue: 5)
        instance.description()
        
        let instanceString = MyStructure(myValue: "Steve")
        instance.description()
    }


}

