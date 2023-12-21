//
//  ViewController.swift
//  LearnSwiftUI
//
//  Created by Monica Deshwal on 20/12/23.
//

import UIKit

class Employee {
    
    var name = "Undefined"
    var age = 0
}

class OfficeEmployee: Employee {
    
    var deskNumber = 0
}

class WarehouseEmployee: Employee {
    
    var area = "Undefined"
}


class ViewController: UIViewController {
    
    /*
     Inheritance not only transfer functionality from one class to another but also connects the classes together. The  superclass and their subclasses are linked together in a hierachical chain. Because of this, whenever we declare a variable of the type of the superclass, object of the subclasses can be assigned to that variable too. This is a very important feature that allows us to do the things like creating the array of objects that are of differnt classes but belong to the same hierarchy.
     */
    /*
     is :- The operator returns a boolean indicating whether the value is of a certain data type
     as :- This operator converts a value of one class to another class when possible
     */

    /*
     The as operator works on objects that belong to the same class hierarchy. Because sometimes the object that require casting are not in the same hierarchy, swift defines several general data types to represent values of any kind. The most frequently used as Any, AnyObject and AnyClass.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var list: [Employee] = [OfficeEmployee(), WarehouseEmployee(), OfficeEmployee()]
        
        //indetifying the objects data type
        var countOffice = 0
        var countWarehouse = 0
        
        for obj in list {
            
            if obj is OfficeEmployee {
                
                countOffice += 1
            } else if obj is WarehouseEmployee {
                
                countWarehouse += 1
            }
        }
        
        print("We have \(countOffice) employees working at the office")
        print("We have \(countWarehouse) employees working at the Warehouse")
        
        //casting an object
        for obj in list {
            
            if obj is OfficeEmployee {
                
                let temp = obj as! OfficeEmployee
                temp.deskNumber = 100
            } else if obj is WarehouseEmployee {
                
                let temp = obj as! WarehouseEmployee
                temp.area = "New Area"
            }
        }
        
        
        //casting an object with as? operator
        for obj in list {
            
            if let temp = obj as? OfficeEmployee {
                
                temp.deskNumber = 100
            } else if let temp = obj as? WarehouseEmployee {
                
                temp.area = "New Area"
            }
        }
        
        
        // casting an object on the fly
        let myArea = (list[1] as! WarehouseEmployee).area
        print("The area of employee 1 is \(myArea)")
        
        // working with the objects of any object type
        let anyObjectList: [AnyObject] = [Employee(), Department(), Department()]
        
        for obj in anyObjectList {
            
            if let temp = obj as? Employee {
                
                temp.name = ""
            } else if let temp = obj as? Department {
                
                temp.area = ""
            }
        }
    }
    
}

class Department {
    
    var area = "Undefined"
}
