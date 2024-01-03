//
//  ContentView.swift
//  SwitUIBaseBranch
//
//  Created by Monica Deshwal on 29/12/23.
//

import SwiftUI
/*
 Custom layout allows us to specify the exact position of each view in 
 */

struct ContentView: View {
    var body: some View {
        Grid {
            GridRow {
                Image(systemName: "phone")
                    .frame(width: 100, height: 100)
                    .background(.blue)
                ExtractedView()
            }
        }.font(.title2)
    }
}

struct ExtractedView: View {
    var body: some View {
        Grid(alignment: .leading) {
            GridRow {
                Text("My Name")
            }
            GridRow {
                Text("My Number")
            }
        }
    }
}

#Preview {
    ContentView()
}
