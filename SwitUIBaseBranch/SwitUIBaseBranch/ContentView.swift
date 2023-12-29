//
//  ContentView.swift
//  SwitUIBaseBranch
//
//  Created by Monica Deshwal on 29/12/23.
//
/*
 Clipped(): This modifier clips the image to the view's frame
 resizable(): This modifier resizes the image to fit within the view's frame.(Imge is squared)
 */
/*
 ScaleMetric: This property wrapper scales a value according to the font size selected by the user from the settings app. The relativeTo argument is an enumeration value that determines the dynamic font type of reference, The vlues avaialable are body, callout, caption1, largetitle. If the argument is ignored, the value is scaled relative to style set by the system.
 */
import SwiftUI

struct ContentView: View {
    @ScaledMetric var customSize: CGFloat = 100
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .resizable()
                .frame(width: 250, height: 200)
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            //maintaining the original ratio
            Image(systemName: "globe")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 200)
            
            Image(systemName: "globe")
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 200)
                .clipped()
            
            Image(systemName: "globe")
                .resizable()
                .scaledToFit()
                .padding()
                .scaleEffect(CGSize(width: 0.5, height: 0.5))
                .blur(radius: 5.0)
            
            //Scaled metric
            Image("globe")
                .resizable()
                .frame(width: customSize, height: customSize)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
