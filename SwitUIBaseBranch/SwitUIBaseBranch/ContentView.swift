//
//  ContentView.swift
//  SwitUIBaseBranch
//
//  Created by Monica Deshwal on 29/12/23.
//

import SwiftUI

/*
 Alignment of the tallest view
 */

extension VerticalAlignment {
    
    enum BusAlignment: AlignmentID {
        
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[VerticalAlignment.center]
        }
    }
    
    static let alignBus = VerticalAlignment(BusAlignment.self)
}

struct ContentView: View {
    var body: some View {
        HStack(alignment: .center) {
            Image("image1")
            Image("image2")
            Image("image3")
        }.border(Color.blue, width: 2)
        
        //Generate your own center alignment
        HStack(alignment: .center) {
            Image("image1")
            Image("image2").alignmentGuide(VerticalAlignment.center, computeValue: { dimension in
                return dimension[VerticalAlignment.center] + 18
            })
            Image("image3")
        }.border(Color.blue, width: 2)
        
        //Custom alingment extension
        HStack(alignment: .alignBus) {
            
            VStack {
               Image("image2")
            }
            VStack(alignment: .leading) {
              
                Text("Mommies love")
                Text("Beta's fun")
                    .font(.largeTitle)
            }
        }.border(Color.green, width: 4)
        
        //Updating the center alignment
        HStack {
            VStack {
                
                Image("image3")
                    .alignmentGuide(.bottom) { dimension in
                     dimension[VerticalAlignment.center] - 40
                    }
            }
            
            VStack(alignment: .leading) {
                
                Text("Do regular excercise")
                Text("Eat healthy")
                    .font(.largeTitle)
                    .alignmentGuide(VerticalAlignment.center) { dimension in
                        dimension[VerticalAlignment.center]
                    }
            }
        }.border(Color.yellow, width: 5)
    }
}

#Preview {
    ContentView()
}
