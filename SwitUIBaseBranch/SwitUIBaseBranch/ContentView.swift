//
//  ContentView.swift
//  SwitUIBaseBranch
//
//  Created by Monica Deshwal on 29/12/23.
//

import SwiftUI
/*
 Custom modifiers encapsulate multiple modifiers in a single structure that we can apply later to the views with the modifier() modifier. The structure must conform to the viewmodifier protocol and implement a method called body that receives a parameter of type content. The parameter represents the views we want to modify and therefore, it is to this parameter that we apply the actual modifiers.
 */

struct MyModifiers: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .font(Font.system(size: 100).weight(.semibold))
            .foregroundColor(.secondary)
    }
}

struct FloatModifier: ViewModifier {
    
    var size: CGFloat
    
    init(size: CGFloat) {
        self.size = size
    }
    
    func body(content: Content) -> some View {
        
        content
            .font(Font.system(size: size).weight(.semibold))
            .foregroundColor(.green)
    }
}

struct ContentView: View {
   
    let fontSize: CGFloat = 100
    
    var body: some View {
        Image(systemName: "envelope.circle")
            .font(Font.system(size: fontSize))
            .onAppear(perform: {
                print("Current font size: \(fontSize)")
            })
        
        Image(systemName: "envelope.circle").modifier(MyModifiers())
        
        Text("Update the modifier").modifier(MyModifiers())
        
        Image(systemName: "figure.walk.diamond")
            .modifier(FloatModifier(size: 60))
    }
}

#Preview {
    ContentView()
}
