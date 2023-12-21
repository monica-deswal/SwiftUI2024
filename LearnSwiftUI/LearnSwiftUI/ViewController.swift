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
        // Do any additional setup after loading the view.
    }


    // Converting a number into string
    func numberIntoString() {
        
        let age = String(44)
        var myText = "Total digits \(age.count)"
    }
    
    // Processing the strings characters
    func processStringCharacters() {
        
        var text = "Hello World"
        
        if !text.isEmpty {
            
            let start = text.startIndex
            let firstChar = text[start]
            
            print("First character is \(firstChar)")
        }
    }
    
    // calculating a specific Index
    func calculateASpecificIndex() {
        
        var text = "Hello World"
        let start = text.startIndex
        let newIndex = text.index(start, offsetBy: 6)
        
        print("The character is \(text[newIndex])")
    }
    
    // getting the next index
    func getTheNextIndex() {
        
        var text = "John"
        let start = text.startIndex
        var next = text.index(after: start)
        
        print("Second letter is \(text[next])")
    }
    
    //Inserting a character into string
    func insertCharIntoString() {
        
        var text = "Hello World"
        text.insert("!", at: text.endIndex)
        
        print("New string is \(text)")
    }
    
    // removing a chahracter
    func removeCharacter() {
        
        var text = "Hello World"
        var findIndex = text.firstIndex(of: " ")
        
        if let index = findIndex {
            
            text.remove(at: index)
            
        }
        print("New string is \(text)")
    }
    
    //getting a range of character
    func getARangeInString() {
        
        let text = "Hello World"
        var start = text.startIndex
        var findIndex = text.firstIndex(of: " ")
        
        if let end = findIndex {
            
            print("First word in \(text[start..<end])")
        }
    }
    
    //working with range of characters
    func replaceSubrange() {
        
        var text = "Hello World"
        var start = text.startIndex
        var findIndex = text.firstIndex(of: " ")
        
        if let end = findIndex {
            
            text.replaceSubrange(start..<end, with: "Goodbye")
        }
        
        findIndex = text.firstIndex(of: " ")
        if let start = findIndex {
            
            text.removeSubrange(start...)
        }
    }
    
    //Implementing string methods
    func uppercaseTheRangedText() {
        
        let text = "Hello World"
        if text.hasSuffix("World") {
            
            print(text.uppercased())
        }
    }
}

