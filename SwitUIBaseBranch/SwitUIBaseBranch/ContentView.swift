//
//  ContentView.swift
//  SwitUIBaseBranch
//
//  Created by Monica Deshwal on 29/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue: Float = 5
    @State private var currentState: Bool = true
    
    @State private var textActive: Bool = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $currentState) {
                Text(currentState ? "On" : "Off")
                Text("Enable or disable")
            }
            Spacer()
        }
        .padding()
        definingTheToggleStyle()
        generateTheToggle()
        
        VStack {
            HStack {
                Toggle("Enabled", isOn: $currentState)
                    .toggleStyle(MyStyle())
            }
            Spacer()
        }.padding()
        
        VStack {
            Text("Current Value: \(currentValue.formatted(.number.precision(.fractionLength(0))))")
            Slider(value: $currentValue, in: 0...10, step: 1.0)
            Spacer()
        }.padding()
        
        VStack {
            Text("Current Value: \(currentValue.formatted(.number.precision(.fractionLength(0))))")
                .padding()
                .background(textActive ? .yellow : .clear)
            
            Slider(value: $currentValue
                   , in: 0...10
                   , step: 1.0, onEditingChanged: { self.textActive = $0})
            Spacer()
        }.padding()
    }
    
    func generateTheToggle() -> some View {
        @State var currentStat: Bool = true
        return HStack {
            
            Toggle("", isOn: $currentStat)
                .labelsHidden()
            Text(currentStat ? "On" : "Off")
                .padding()
                .background(Color(currentStat ? .yellow : .gray))
        }.padding()
    }
    
    func definingTheToggleStyle() -> some View{
        @State var currentStat: Bool = true
        
        return HStack {
            Toggle(isOn: $currentStat, label: {
                Label("Send", systemImage: "mail")
            }).toggleStyle(.button)
        }.padding()
    }
}

struct MyStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center) {
            configuration.label
            Spacer()
            Image(systemName: "checkmark.rectangle.fill")
                .font(.largeTitle)
                .foregroundStyle(configuration.isOn ? .green : .gray)
                .onTapGesture {
                    configuration.$isOn.wrappedValue.toggle()
                }
        }
    }
}

#Preview {
    ContentView()
}
