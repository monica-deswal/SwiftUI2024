//
//  ContentView.swift
//  SwitUIBaseBranch
//
//  Created by Monica Deshwal on 29/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var title: String = "Default Title"
    @State private var titleInput: String = ""
    
    var body: some View {
        VStack {
           HeaderView(title: title
                      , titleInput: $titleInput)
            Button(action: {
                title = titleInput
                titleInput = ""
            }, label: {
                Text("Button")
            })
            Spacer()
        }.padding()
    }
}

struct HeaderView: View {
    var title: String
    @Binding var titleInput: String
    
    var body: some View {
        VStack {
            Text(title)
                .padding(10)
            TextField("Insert Title", text: $titleInput)
                .textFieldStyle(.roundedBorder)
        }
    }
}

#Preview {
    ContentView()
}
