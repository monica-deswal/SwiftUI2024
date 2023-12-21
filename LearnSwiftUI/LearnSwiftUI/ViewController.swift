//
//  ViewController.swift
//  LearnSwiftUI
//
//  Created by Monica Deshwal on 20/12/23.
//

import UIKit

protocol Printer {
    
    var name: String {get set}
    func printDescription()
}

struct Employee: Printer {
    
    var name: String
    var age: Int
    
    func printDescription() {
        
        print("Description: \(name) \(age)")
    }
}

struct Offices: Printer {
    
    var name: String
    var employee: Int
    
    func printDescription() {
        
        print("Description: \(name) \(employee)")
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let employee1 = Employee(name: "Steve", age: 61)
        let office1 = Offices(name: "Mail", employee: 2)
        
        employee1.printDescription()
        office1.printDescription()
        
        //Using protocol as data types
        var list: [Printer] = [employee1, office1]
        for element in list {
            if let employe = element as? Employee {
                print(element.age)
            }
            element.printDescription()
        }
        
        //retreiving the protocol
        let file = getFile(type: 1)
        file.printDescription()
    }
    
    //returning values of a protocol data type
    func getFile(type: Int) -> Printer {
        
        var data: Printer!
        if type == 1 {
            
            data = Employee(name: "Steve", age: 61)
        } else if type == 2 {
            
            data = Offices(name: "Mail", employee: 2)
        }
    }
}

