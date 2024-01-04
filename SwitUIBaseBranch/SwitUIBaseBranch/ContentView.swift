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
    @State private var selected: Bool = true
    
    var body: some View {
        Grid {
            GridRow {
                Image(systemName: "phone")
                    .frame(width: 100, height: 100)
                    .background(.blue)
                ExtractedView()
            }
        }.font(.title2)
        
        //Custom layout with the layout class
        MyLayout {
            Group {
                Text("First")
                    .padding(10)
                    .background(.red)
                    .cornerRadius(10)
                
                Text("Second")
                    .padding(10)
                    .background(.red)
                    .cornerRadius(10)
                
                Text("Third")
                    .padding(10)
                    .background(.red)
                    .cornerRadius(10)
            }.font(.title)
        }
        
        //Changing the style based on some action
        let SelectedLayout = selected ? AnyLayout(MyLayout()) : AnyLayout(VStackLayout(alignment: .leading))
        
        VStack(alignment: .leading) {
            
            Toggle(isOn: $selected, label: {
                Text(selected ? "Custom" : "Standard")
            }).padding(.bottom)
            
            SelectedLayout {
                Group {
                    Text("First")
                        .padding(10)
                        .background(.red)
                        .clipShape(.rect(cornerRadius: 10))
                    Text("Second")
                        .padding(10)
                        .background(.red)
                        .clipShape(.rect(cornerRadius: 10))
                    Text("Third")
                        .padding(10)
                        .background(.red)
                        .clipShape(.rect(cornerRadius: 10))
                }
            }
        }.padding()
            .font(.headline)
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

struct MyLayout: Layout {
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        
        var posX: CGFloat = bounds.origin.x
        var posY: CGFloat = bounds.origin.y
        
        for (index, view) in subviews.enumerated() {
            
            if index > 0 {
                posY += 10
                posX += 30
            }
            
            view.place(at: CGPoint(x: posX, y: posY), proposal: .unspecified)
            posY += view.sizeThatFits(.unspecified).height
        }
    }
    
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        var totalWidth: CGFloat = 0
        var totlaHeight: CGFloat = 0
        
        for (index, view) in subviews.enumerated() {
            if index > 0 {
                totlaHeight += 10
            }
            
            let viewSize = view.sizeThatFits(.unspecified)
            totalWidth += viewSize.width + CGFloat(30 * index)
            totlaHeight += viewSize.height
        }
        return CGSize(width: totalWidth, height: totlaHeight)
    }
}

#Preview {
    ContentView()
}
