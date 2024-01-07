//
//  ContentView.swift
//  SwitUIBaseBranch
//
//  Created by Monica Deshwal on 29/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue: Float = 0
    
    @State private var currentVal: Float = 0
    @State private var goingUp: Bool = true
    
    var body: some View {
        VStack {
            Text("current Value: \(currentValue.formatted(.number.precision(.fractionLength(0))))")
            Stepper("Counter", value: $currentValue, in: 0...100)
            Spacer()
            
            //stepping through 5
            Stepper("Counter", value: $currentValue, in: 0...100, step: 5)
            Spacer()
            
            //display if the value is increased or decreased
            HStack {
                Text("Current Value: \(currentVal.formatted(.number.precision(.fractionLength(0))))")
                Image(systemName: goingUp ? "arrow.up" : "arrow.down")
                    .foregroundStyle(goingUp ? .green : .red)
                Stepper("") {
                    currentVal += 5
                    goingUp = true
                } onDecrement: {
                    currentVal -= 5
                    goingUp = false
                }.labelsHidden()
                }

            }
        .padding()
    }
}

#Preview {
    ContentView()
}
