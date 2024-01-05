//
//  ContentView.swift
//  SwitUIBaseBranch
//
//  Created by Monica Deshwal on 29/12/23.
//

import SwiftUI
/* State Property
 Wrapped value: This proeprty return the value managesd by the @state proeprty
 ProjectedValue: This proeprty returns a structure of type Binding that creates the Bidirectional binding with the view.
 */
/* Binding property
 WrappedValue: This property returns the value managed by the @Binding property
 projectedValue: This property returns a structure of type Binding that creates the Bidirectional bindign with the view.
 
 */

struct ContentView: View {
//    @State private var title: String = "Default Title"
//    @State private var titleInput: String = ""
    
    @State private var bindingTitle: String = "DefaultTitle"
    @State private var bindingTitleInput: String = ""
    
    var body: some View {
//        VStack {
//            Text(_title.wrappedValue)
//                .padding(10)
//            TextField("Insert title"
//                      , text: _titleInput.projectedValue)
//            .textFieldStyle(.roundedBorder)
//            Button(action: {
//                _title.wrappedValue = _titleInput.wrappedValue
//                _titleInput.wrappedValue = ""
//            }, label: {
//                Text("Change title")
//            })
//            Spacer()
//        }
//        .padding()
        
        VStack {
            HeaderView(title: $bindingTitle, titleInput: $bindingTitleInput)
            Button(action: {
                bindingTitle = bindingTitleInput
                bindingTitleInput = ""
            }, label: {
                Text("Change title")
            })
            Spacer()
        }.padding()
        
    }
}

struct HeaderView: View {
   
    
    @Binding var title: String
    @Binding var titleInput: String
    let counter: Int
    
    init(title: Binding<String>, titleInput: Binding<String>) {
        _title = title
        _titleInput = titleInput
        
        let sentence = _title.wrappedValue
        counter = sentence.count
    }
    
    var body: some View {
        VStack {
            Text("\(title) (\(counter))")
                .padding(10)
            TextField("Insert TITLE", text: $titleInput)
                
        }
    }
}

#Preview {
    ContentView()
}

#Preview("Header") {
    let constantTitle = Binding<String>(
        get: { return "My Preview title"},
        set: {value in print(value)})
    
    let constantInput = Binding<String>(
        get: {return ""},
        set: {value in print(value) })
    
    return HeaderView(title: constantTitle, titleInput: constantInput)
}
