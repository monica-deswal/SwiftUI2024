//
//  RegexBuilder.swift
//  LearnSwiftUI
//
//  Created by Monica Deshwal on 28/12/23.
//

import Foundation
import RegexBuilder

struct RegexBuilder {
    
    func finalLoadMethod() {
        
    }
    
    // defining a regular exoression with a regex builder
    func definingTheRegularExpression() {
        
        let regexExp = Regex {
            "Name:"
            OneOrMore(.whitespace)
            OneOrMore {
                CharacterClass("a"..."z", "A"..."Z")
            }
        }
            
         let message = "Name: John"
         let result = message.matches(of: regexExp)
        if !result.isEmpty {
            
            print(result[0].output)
        }
    }
    
    //Capturing a value from a regex builder
    func captureTheOutputValue() {
        
        let regex = Regex {
            "Name:"
            OneOrMore(.whitespace)
            Capture {
                One(CharacterClass("A"..."Z"))
                OneOrMore {
                    CharacterClass("a"..."z")
                }
            }
        }
        
        let message = "Name: John"
        let result = message.matches(of: regex)
        if let name = result.first?.output.1 {
            
            print("The name is \(name)") //
        }
    }
    
    //transform values into right data type
    func transformValueIntoRightDataType() {
        
        let message = "09 units, stock 190"
        let regex = Regex {
            
            Capture {
                OneOrMore(.digit)
            } transform: { value in
                Int(value)
            }
            OneOrMore(.any, .reluctant)
            Capture {
                OneOrMore(.digit)
            } transform: { value in
                Int(value)
            }
        }
        
        let result = message.matches(of: regex)
        if let units = result.first?.output.1,
           let stock = result.first?.output.2 {
            
            let total = units + stock
            print("Final stock: \(total)")
        }
    }
    
    //matching date and currency
    func matchDateAndCurrency() {
        
        let seperator = /\n/
        let content = """
                    06/15/2020 Lamp $35
                    06/21/2020 Desk $250.50
                    06/29/2020 Chair $129.00 
"""
        let regex = Regex {
            Capture {
                One(.date(.numeric, locale: .current, timeZone: .current))
            }
            OneOrMore(.whitespace)
            Capture {
                OneOrMore(CharacterClass("a"..."z", "A"..."Z"))
            }
            OneOrMore(.whitespace)
            Capture {
                One(.localizedCurrency(code: "USD", locale: .current))
            }
        }
        
        let lines = content.split(separator: seperator)
        for line in lines {
            
            if let result = line.firstMatch(of: regex) {
                
                print("Date: \(result.output.1.formatted(date: .complete, time: .omitted))")
                print("Item: \(result.output.2)")
                print("Price: \(result.output.3)")
            }
        }
    }
}
