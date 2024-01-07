//
//  ContentView.swift
//  SwitUIBaseBranch
//
//  Created by Monica Deshwal on 29/12/23.
//

import SwiftUI
/*
 We use stack views as container for other views, but SwiftUI defines a specific view for this purpose called GroupBox. This view is defined with a background color and round corners to visually group views and controls
 */

struct ContentView: View {
    @State private var setting1: Bool = true
    @State private var setting2: Bool = true
    @State private var setting3: Bool = true
    
    var body: some View {
        GroupBox("Settings") {
            VStack(spacing: 10) {
            Toggle("Autocorrection", isOn: $setting1)
            Toggle("Capitalization", isOn: $setting2)
            Toggle("Editable", isOn: $setting3)
            }
        }.padding()
    }
}

#Preview {
    ContentView()
}
