//
//  ContentView.swift
//  SwitUIBaseBranch
//
//  Created by Monica Deshwal on 29/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var colorActive: Bool = false
    @State private var showInfo = false
    
    @State private var color = Color.clear
    @State private var buttonDisabled = false
    
    @State private var expanded: Bool = false
    
  //  @State private var color = Color.gray
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Dafault Title")
                .padding()
                .background(colorActive ? Color.green : .clear)
            Button("Change Color") {
                changeColor()
            }
        }
        .padding()
        
        //more efficient way of writing
        VStack(spacing: 10) {
            Text("Default Title")
                .padding()
                .background(colorActive ? .green : .clear)
            Button("Change Color", action: changeColor)
            Spacer()
        }.padding()
        
        //use of if,else
        VStack(spacing: 10) {
            if showInfo {
                Text("This is the information")
            }
            Button("Show Information") {
                showInfo.toggle()
            }.padding()
            
            Spacer()
        }
        
        //disabled the button
        VStack(spacing: 10) {
            Text("Default Title")
                .padding()
                .background(color)
            Button("Change Color") {
                color = .green
                buttonDisabled = true
            }
            .disabled(buttonDisabled)
            Spacer()
        }.padding()
        
        //Changing the rendering property
        VStack(spacing: 10) {
            Text("Default Title")
                .frame(minWidth: 0, maxWidth: expanded ? .infinity : 150, maxHeight: 50)
                .background(.yellow)
            Button(action: {
                expanded.toggle()
            }, label: {
                Image(systemName: expanded ? "traction.control.tirepressure.exclamationmark" : "rectangle.expand.vertical")
                Text(expanded ? "Contract" : "Expand")
            })
            Spacer()
        }.padding()
        
        //two Button Action
        VStack(spacing: 10) {
            HStack {
                Button("Cancel") {
                    print("Cancel Action")
                }.buttonStyle(.bordered)
                 Spacer()
                Button("Send") {
                    print("Send information")
                }.buttonStyle(.borderedProminent)
                    
            }
            Spacer()
        }.padding()
        
        // SFSymbol images change with the font size
        VStack(spacing: 10) {
            Button(action: {
                print("Delete item")
            }, label: {
                HStack {
                    Image(systemName: "mail")
                        .imageScale(.large)
                    Text("Mail")
                }
            })
            .buttonStyle(.plain)
            .background(.purple)
            .font(.largeTitle)
            .controlSize(.large)
            Spacer()
        }.padding()
        
        //Adding the own style
        VStack {
            Text("Default Title")
                .padding()
                .foregroundStyle(color)
            Button("Change Color") {
                color = Color.green
            }.buttonStyle(MyStyle())
            Spacer()
        }.padding()
    }
    
    func changeColor() {
        colorActive.toggle()
    }
}

struct MyStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        let pressed = configuration.isPressed
        return configuration.label
            .padding()
            .border(.green, width: 5)
            .scaleEffect(pressed ? 1.2 : 1.0)
    }
}

#Preview {
    ContentView()
}
