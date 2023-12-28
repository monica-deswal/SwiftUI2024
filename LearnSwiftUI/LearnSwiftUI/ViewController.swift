//
//  ViewController.swift
//  LearnSwiftUI
//
//  Created by Monica Deshwal on 20/12/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //using regular expression
        let message = "Name: John"
        let regex = /Name:\s+[a-zA-Z]+/
        
        if let match = message.firstMatch(of: regex) {
            
            let found = match.output
            print("Found: \(found)")
        }
        
        // capturing values with subexpression
        let regexExpression = /Name:\s+([a-zA-Z]+)/
        if let match = message.firstMatch(of: regexExpression) {
            let found = match.output.1
            print("the name is \(found)")
        }
        
        //capturing multiple values
        let messages = "Name: John, Name: George, Name: David"
        let regexMult = /Name:\s+([a-zA-Z]+)/
        
        let matches = messages.matches(of: regexMult)
        
        if !matches.isEmpty {
            
            let names = matches.map({ value in
                
                return value.output.1
            })
            
            let list = names.joined(separator: ", ")
            print("Names are \(list)")
        }
        
        //pricessing multiple lines of text with a regualr expression
        let messageMultLine = """
        John
        George
        Martin
        """
        
        let seperator = /\n/
        let lines = messageMultLine.split(separator: seperator)
        print(lines)
        
        //replacing the chahracters that matches a regualar expression
        //let seperator = /\n/
        let array = messageMultLine.replacing(seperator, with: ", ")
        print("the value of array is \(array)")
    }
}

