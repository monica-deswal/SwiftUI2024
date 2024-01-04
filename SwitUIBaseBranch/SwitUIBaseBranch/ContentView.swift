//
//  ContentView.swift
//  SwitUIBaseBranch
//
//  Created by Monica Deshwal on 29/12/23.
//

import SwiftUI
/*
 The environment is a data structure that belongs to the application and contains data about the application and the views. It is like an external storage space accessible from anywhere in our code. The values stored in the environment can be modified or more data can be added to it.
 */
struct ContentView: View {
    @Environment(\.colorScheme) var mode
    
    var body: some View {
        
        Text("Hello world")
            .foregroundStyle(Color("MyColor"))
        
        Image(systemName: "trash")
            .font(Font.system(size: 100))
            .foregroundColor(mode == .dark ? .yellow : .blue)
            .symbolVariant(mode == .dark ? .fill : .circle)
    }
}

#Preview {
//    ContentView()
//        .environment(\.colorScheme, .dark)
    ContentView()
}
