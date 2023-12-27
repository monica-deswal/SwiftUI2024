//
//  ViewController.swift
//  LearnSwiftUI
//
//  Created by Monica Deshwal on 20/12/23.
//

import UIKit

/*
 Protocol can also define generic properties and methods, but they work slightly different than the generic types studied before. when we want to define a protocol with a generic property and methods, we first must define the name of the generic type with the associated type keyword.
 */
/*
 The following are some of the protocols available:
 1. Equatable: This protocol defines a data type which values can be compared with other values of the same type using the operator == and !=
 2. Comparable: This protocol defines a data type with other values of the same type using the operators >, <, >=, and <=
 3. Numeric: This protocol defines a data type that only works with values that can participate in arithmetic operations.
 4. Hashable: This protocol defines a data type (unique identifier) required for the value to be included in collections, such as sets and dictionaries.
 6. caseIterable:- This protocol defines a data type, usually an enumeration without associated values, that includes a property called allcases that contains the collection of all the cases included in the data type.
 */


struct Employees: Equatable {
    
    var name: String
    var age: Int
    
    static func ==(value1: Employees, value2: Employees) -> Bool {
        
        return value1.age == value2.age
    }
}

//Adding a type constraint to a generic function
struct EquatableEmployee: Equatable {
    
    var name: String
    var age: Int
}

func compareValues<T: Equatable>(value1: T, value2: T) -> String {
    
    let message = value1 == value2 ? "equal" : "different"
    return message
}

func calculateResult<T: Numeric>(value1: T, value2: T) {
    print(value1 + value2)
}

//conforming to the comparable protocol
struct ComparableEmployees: Comparable {
  
    var name: String
    var age: Int
    
    static func < (lhs: ComparableEmployees, rhs: ComparableEmployees) -> Bool {
        return lhs.age < rhs.age
    }
    
    static func > (lhs: ComparableEmployees, rhs: ComparableEmployees) -> Bool {
        return lhs.age > rhs.age
    }

    static func <= (lhs: ComparableEmployees, rhs: ComparableEmployees) -> Bool {
        return lhs.age <= rhs.age
    }
    
    static func >= (lhs: ComparableEmployees, rhs: ComparableEmployees) -> Bool {
        return lhs.age >= rhs.age
    }
}

struct HashableEmplyees: Hashable {
    
    var name: String
    var age: Int
    
}

struct HashableEmployee: Hashable {
    var name: String
    var age: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

enum Departments: CaseIterable {
    
    case mail
    case marketing
    case managing
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let employee = Employee(name: "Steve")
        
        // conforming to equatable protocol
        let employee1 = Employees(name: "Steve", age: 61)
        let employee2 = Employees(name: "Fred", age: 61)
        
        let message = employee1 == employee2 ? "Equal" : "Different"
        print(message)
        
        //adding a type constraint to a generic function
        let result = compareValues(value1: employee1, value2: employee2)
        
        //using the numeric protocol to set a type contraint
        calculateResult(value1: 3.6, value2: 4)
        
        
        //comparable protocol
        let comparablEmployee1 = ComparableEmployees(name: "Steve", age: 61)
        let comparablEmployee2 = ComparableEmployees(name: "Fred", age: 63)
        if comparablEmployee1 > comparablEmployee2 {
            print("\(comparablEmployee1.name) is older")
        } else {
            print("\(comparablEmployee2.name) is older")
        }
        
        //conforming to hashable protocol
        let hashableEmployee1 = HashableEmplyees(name: "Steve", age: 61)
        let hashableEmployee2 = HashableEmplyees(name: "Fred", age: 64)
        
        let list: Set<HashableEmplyees> = [hashableEmployee1, hashableEmployee2]
        
        for item in list {
            print(item.name)
        }
        
        //conforming to case iterable protocol
        var messageCaseIterable = ""
        for department in Departments.allCases {
            
            messageCaseIterable += "\(department)"
        }
        print(messageCaseIterable)
        
        // Comparable
        let employeeHashable1 = EmployeeHashable(name: "Steve", age: 61)
        let employeeHashable2 = EmployeeHashable(name: "Robert", age: 63)
        
        let employeeHashableSet: Set<EmployeeHashable> = [employeeHashable1, employeeHashable2]
        for item in employeeHashableSet {
            
            print(item.name)
        }
        
        let employeeHashValue = EmployeeHashValue(name: "Steve", age: 62)
        print(employee.name.hashValue)
        
        // case iterable
        var messageIterable = ""
        for department in DepartmentsCaseIterable.allCases {
            
            messageIterable += "\(department)"
        }
        print("the value of case iterable \(messageIterable)")
    }
}

// MARK: Generic protocol

protocol Printer {
    associatedtype protype
    var name: protype { get set }
}

struct Employee: Printer {
    var name: String
}

// Comparable
struct EmployeeHashable: Hashable {
 
    var name: String
    var age: Int
}

// defining our own hash value
struct EmployeeHashValue: Hashable {
    
    var name: String
    var age: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

// conforming to caseiterable protocol
enum DepartmentsCaseIterable: CaseIterable {
    
    case mail
    case marketing
    case managing
}
