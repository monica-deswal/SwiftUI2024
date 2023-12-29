//
//  ContentView.swift
//  SwitUIBaseBranch
//
//  Created by Monica Deshwal on 29/12/23.
//

import SwiftUI
/*
 Color views are used to define a color for the content of other views, but they are views and therefore they can be included in the interface like any other.
 */
/*
 we can add a new color in the xcassets and we can provide different color for the light and dark mode
 */

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Color(red: 0.9, green: 0.5, blue: 0.2)
                .frame(width: 250, height: 100)
            
            Color(red: 100/255, green: 228/255, blue: 255/255)
                .frame(width: 250, height: 100)
            
            Color("AppColor")
                .frame(width: 250, height: 100)
            
            Text("Hello")
                .font(.largeTitle)
                .padding(5)
                .foregroundColor(.green)
                .background(.yellow.gradient)
                .border(Color.pink, width: 5)
                .cornerRadius(6)
                
            //Meterials
            Text("Material value")
                .font(.largeTitle)
                .background(.thickMaterial)
            
            Text("Material part 2")
                .font(.largeTitle)
                .background(.red)
                .foregroundStyle(.thickMaterial)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
