//
//  ContentView.swift
//  SwitUIBaseBranch
//
//  Created by Monica Deshwal on 29/12/23.
//

import SwiftUI
/*
 Bidirectional binding is used when we want to update the data in 2 way like switches we use $ sign for that.
 */

struct ContentView: View {
    
    @State private var title: String = "Default Title"
    
    @State private var validTitleState = "Valid"
    @State private var isValid: Bool = true
    
    @State private var textfieldTitle: String = "Default Title"
    @State private var titleInput: String = ""
    
    var body: some View {
        VStack {
            Text(title)
                .padding(10)
            Button(action: {
                title = "New title"
            }, label: {
                Text("Change title")
            })
            Spacer()
        }.padding()
        
        // check for the title in accordance with ternary operation
        VStack {
            Text(validTitleState)
                .padding(10)
            Button(action: {
                isValid.toggle()
                title = isValid ? "Valid" : "Invalid"
            }, label: {
                Text("Change Validation")
            })
            Spacer()
        }.padding()
        
        //Binding property
        VStack {
            Text(textfieldTitle)
                .padding(10)
            TextField("Insert Title", text: $titleInput)
                .textFieldStyle(.roundedBorder)
            Button(action: {
                textfieldTitle = titleInput
                titleInput = ""
            }, label: {
                Text("Change title")
            })
            Spacer()
        }.padding()
    }
}

#Preview {
    ContentView()
}
