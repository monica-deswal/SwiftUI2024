//
//  ContentView.swift
//  SwitUIBaseBranch
//
//  Created by Monica Deshwal on 29/12/23.
//

import SwiftUI
/*
 Most modifiers are defined by the view protocol and then implemented by the structure that conforms to it.
 */
/*
Notice that for a flexible view to work properlyit is recommended to always declare the minimum size as well. If you are declaring a flexible width, you should set the minWidth argument, and if you are declaring a flexible height, you should also include the minHeight argument.
 */
/*
 Drag and drop the differnet font file with the .ttf extension, and in the plist add the row with the name (Font provided by application) and add on the index 0 with the name of the font name
 */
struct ContentView: View {
    let number: Float = 30.8762
    let today = Date()
    
    var body: some View {
        //On currency
        Text("My Number: \(number.formatted(.currency(code: "USD")))")
            .frame(width: 250, height: 100, alignment: .center)
            .font(.headline)
            .fontWeight(.heavy)
            .foregroundColor(Color.red)
        
        //Date
        Text(today, style: .timer)
        
        Text("Flexible width or height")
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: 0).padding(15)
        
        Text("Padding text")
            .padding(EdgeInsets(top: 0.0, leading: 40.0, bottom: 0, trailing: 40))
        
        Text("Set padding")
            .padding([.top, .bottom], 30)
        
        //System font
        Text("System font")
            .font(Font.system(size: 56))
        
        //Custom font
        Text("custom font")
            .font(Font.custom("Georgia", size: 50))
        
        //multiple style
        Text("Adding multiple style")
            .font(.largeTitle)
            .underline()
            .fontWeight(.heavy)
        
        //adding underline to a subtext
        Text("Underline \(Text("subtext").underline())")
        
        //addig weight modifier
        Text("Adding weight modifier")
            .font(.largeTitle.weight(.semibold))
        
        //Multilie text
        Text("Mosters are real, ghosts are real too. They live inside us, and sometime they win. Stephen King")
            .padding()
            .lineLimit(1)
    }
}

#Preview {
    ContentView()
}
