//
//  ViewController.swift
//  LearnSwiftUI
//
//  Created by Monica Deshwal on 20/12/23.
//

import UIKit

class Employee {
    
    lazy var name: String = {
        
       //loading name from a server
        print("Loading...")
        return "Undefined"
    }()
    var age = 0
}

// declaring private properties
class Student {
    
    private var name = "Indefined"
    private var age = 0
    
    func showValues() {
        
        print("Name: \(name)")
        print("Age: \(age)")
    }
}

//declaring a public getter and private setter
class CoWorkSpace {
    
    private var name = "Undefined"
    public private (set) var age = 0
    
    func setAge(newAge: Int) {
        
        age = newAge
    }
}

//defining a singleton class
class SingletonEmployee {
    
    var name: String = ""
    var age: Int = 0
    
    static let shared = SingletonEmployee(name: "Undefined", age: 0)
    
    private init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class ViewController: UIViewController {
    
    /*
     Swift defines keywords(also called modifiers) that can be applied to entities(classes, structures, properties, methods) to confer them special attributes. We have seen the mutating and override keyword, but there more available, like the following:
     1. Lazy: The keyword defines a property whose initial valueis not assigned until the property is used for the first time
     2. Final: The keyowrd is used on a class when we don't want to allow the code to create sublcasses of it. It must be declared before the class keyword.
     
     */
    
    /*
     Access control is based on modules and source files, but it also applies to single properties and methods
     1. Public: The keyword determins that an entity is accessible from the module it belongs to and other modukes. The only difernce between public and open is that we can't create sublcasses of public classes outside the module in which they we defined. This also applied to methods and properties (eg: public methods can't be overridden outside the module in which they were declared.)
     
     2. Open: This keyword determines that an entity is accessible from the module it belongs to and other modules.
     
     3. Private: This keyword determines that an entity is accessible only from the context in which it is created(eg : a private property in a class will only be accessible from methods of the same class.
     
     4. FilePrivate: This keyword determines that an entity is accessible only from the file in which it was declared(eg: a fileprivate property in a class willl only be accessible by other enties defined inside the file in which it was declared)
     5. Internal: This keyword determins that an entity is accessible only inside the module in which it was created. This is the default access mode for application. By default, every entity defined in our application is only accessible from inside the application.
     */
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let student = Student()
        student.showValues()
        
        let coworkEmp = CoWorkSpace()
        coworkEmp.setAge(newAge: 25)
        print(coworkEmp.age)
        
        // singelton
        
        let singletonEmployee = SingletonEmployee.shared
        let singletonEmployee1 = SingletonEmployee.shared
        
        singletonEmployee.name = "George"
        print("Value is same due to dingelton \(singletonEmployee.name) \(singletonEmployee1.name)")
    }


}

