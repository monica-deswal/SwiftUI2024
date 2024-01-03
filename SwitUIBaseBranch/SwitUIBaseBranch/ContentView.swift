//
//  ContentView.swift
//  SwitUIBaseBranch
//
//  Created by Monica Deshwal on 29/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Grid {
            GridRow {
                Image(systemName: "message")
                    .frame(width: 100, height: 100)
                Image(systemName: "mic")
                    .frame(width: 100, height: 100)
            }.background(.cyan)
            GridRow {
                Image(systemName: "phone")
                    .frame(width: 100, height: 100)
                Image(systemName: "envelope")
                    .frame(width: 100, height: 100)
            }.background(.red)
        }
        
        Spacer(minLength: 10)
        
        //Keeping the top text message and then the grid view
        Grid(verticalSpacing: 10) {
            
            GridRow {
                Text("Send us a message")
            }.gridCellColumns(2)
            GridRow {
                Image(systemName: "phone")
                    .frame(width: 100, height: 100)
                Image(systemName: "envelope")
                    .frame(width: 100, height: 100)
            }.background(.blue)
        }.font(.title)
        
        //One stack into another stack to acheive the desired result
        Grid {
            
            GridRow {
                
                Image(systemName: "phone")
                    .frame(width: 100, height: 100)
                    .background(.pink)
                
                Grid(alignment: .leading) {
                    GridRow {
                        GridRow {
                            Text("My name")
                        }
                        GridRow {
                            Text("My Number")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
