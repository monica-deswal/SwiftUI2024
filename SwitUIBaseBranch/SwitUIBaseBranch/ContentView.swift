//
//  ContentView.swift
//  SwitUIBaseBranch
//
//  Created by Monica Deshwal on 29/12/23.
//

/*
 Group view is used to group views together, it is used to group multiple view into single and apply the style to several views at the same time.
 */
/*
 If we try to use an if else instruction to return different views depending on a condition, we will get an error. But we can use a Group view to solve the issue. The solution is to insert the contional statement inside a Group view and return that view instead.
 */

import SwiftUI

struct ContentView: View {
    var body: some View {
        let valid = true
        VStack {
            Group {
                Text("This is a list of")
                Text("Cities")
            }.foregroundStyle(.gray)
            
            Group {
                
                Text("Manchester")
                Text("Viena")
            }.font(.largeTitle)
        }
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        
        //Return group view in conditional statement
        return Group {
            if valid {
                Image(systemName: "keyboard")
            } else {
                Text("this state is invalid")
            }
        }
    }
}

#Preview {
    ContentView()
}
