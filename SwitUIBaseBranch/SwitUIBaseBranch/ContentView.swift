//
//  ContentView.swift
//  SwitUIBaseBranch
//
//  Created by Monica Deshwal on 29/12/23.
//

import SwiftUI
/*
 VStack view takes the width of its largest child and the height from the sum of the heights of its children
 */
/*
 layout priority is used when we want the text to not to be truncated.
 Fixed size is on the top most priority if you dont want the text to be truncated
 */

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("City")
            Text("New York")
        }
        .padding()
        
        HStack(alignment: .lastTextBaseline, spacing: 10) {
            Image(systemName: "cloud")
                .font(.system(size: 80))
            Text("New york")
        }
        
        //ZStack
        ZStack {
            Image(systemName: "house")
                .font(.system(size: 100))
            Text("New York")
                .font(.body.bold())
                .foregroundColor(.gray)
                .padding(20)
                .background(Color.yellow)
                .zIndex(-1)
        }
        
        ZStack {
            Image(systemName: "house")
                .font(.system(size: 100))
            Text("New York")
                .font(.body.bold())
                .zIndex(-1)
        }.foregroundColor(.red)
        Spacer(minLength: 20)
        //Vstack inside other stack
        VStack {
            HStack {
                Image(systemName: "cloud")
                    .font(.system(size: 80))
                VStack(alignment: .leading) {
                    Text("City")
                        .foregroundStyle(.gray)
                        .font(.system(size: 20))
                    Text("New york")
                        .font(.title)
                }
                Spacer(minLength: 10)
            }
        }
        Spacer(minLength: 20)
        
        // Safe area
        VStack {
            Spacer()
            HStack {
                Image(systemName: "figure")
                    .font(.system(size: 80))
                VStack(alignment: .leading) {
                   Text("City")
                        .foregroundStyle(.gray)
                    Text("New York")
                        .font(.title)
                }
                Spacer()
            }
            Spacer()
        }.ignoresSafeArea(.container, edges: .bottom)
        
        prioritiesOfViews()
        
        // add a navigation to the safe area
        VStack {
            Spacer()
            HStack {
                Image(systemName: "cursorarrow.rays")
                    .font(.system(size: 80))
                VStack(alignment: .leading) {
                   Text("City")
                        .foregroundStyle(.gray)
                    Text("New York")
                        .font(.title)
                }
                Spacer()
            }
        }
        .safeAreaInset(edge: .bottom) {
            HStack {
                Spacer()
                Text("Important")
                    .padding()
                Spacer()
            }.background(.yellow)
        }
        
        
    }
    
    //Priorities of the views
    func prioritiesOfViews() -> some View {
        
        
        HStack {
            Text("Manchester Large text ")
                .font(.title)
                .lineLimit(1)
                .layoutPriority(1)
            Image(systemName: "cloud")
                .font(.system(size: 40))
            Text("New York")
                .font(.title)
                .lineLimit(1)
                .fixedSize()
                //.layoutPriority(1)
            
        }
    }
}

#Preview {
    ContentView()
}
