//
//  ContentView.swift
//  SwitUIBaseBranch
//
//  Created by Monica Deshwal on 29/12/23.
//

import SwiftUI
/*
 When a view that can take input or process feedback from the user is selected, it is said that the view is in focus. SwiftUI includes seeral tool to process this state. We can process a task when a view gains a focus, know if the focus is on a view, or remove focus from a view. There are two property wrapper available for this purpose @FocusStae and @FocusBinding. @FocusState stores a value that determones where the focus is at the moment, and @FocusBinding is used to pass the state to other views. To manage the state, the framework includes the modifiers
 */

enum FocusName: Hashable {
    case name
    case surName
}

//class ContentViewData: ObservableObject {
//    
//    @Published var titleVal: String = "Default Name"
//    @Published var numberInputVal2: String = ""
//    var currentNumber = ""
//}

struct ContentView: View {
    @State private var title: String = "Default Title"
    @State private var titleInput: String = ""
    
    @FocusState var focusName: FocusName?
    @State private var titleName: String = "DefaultName"
    @State private var nameInput: String = ""
    @State private var surNameInput: String = ""
    
    @State var titleVal = "Default Name"
    @State var numberInputVal = ""
    
    var body: some View {
        
        //saveTheFilledNameAndSurName()
        
        //displayDisabledButtonUntillBothNonEmptyField()
        
       // enterOnlyNumberInput()
        
        //displayMultilineText()
        
      //  enterDataInsecureTextfield()
        
        createTheTextEditorView()
    }
    
    func displayTheTitleFromTextfield() -> some View {
        
        VStack(spacing: 15) {
           Text(title)
                .lineLimit(1)
                .padding()
                .background(Color.yellow)
            TextField("Insert Title", text: $titleInput)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.words)
            Button("Save") {
                title = titleInput
                titleInput = ""
            }
            Spacer()
        }
        .padding()
    }
    
    //When we click the done button, same operation should happen when we click on the save button
    func displayTheTitleFromTextFieldOnKeyboardDoneClick() -> some View {
        VStack(spacing: 15) {
            Text(title)
                .lineLimit(1)
                .padding()
                .background(Color.yellow)
            
            TextField("Insert Title", text: $titleInput)
                .textFieldStyle(.roundedBorder)
                .submitLabel(.continue)
                .onSubmit {
                    assignTitle()
                }
            HStack {
                Spacer()
                Button("Save") {
                    assignTitle()
                }.padding()
            }
        }.padding()
        
    }
    
    
    func saveTheNameAndSurName() -> some View {
        
        VStack(spacing: 10) {
            Text(titleName)
                .lineLimit(1)
                .padding()
                .background(Color.yellow)
            
            TextField("Insert Name", text: $nameInput)
                .textFieldStyle(.roundedBorder)
                .padding(4)
                .background(focusName == .name ? Color(white: 0.9) : .white)
                .focused($focusName, equals: .name)
            
            TextField("Insert Surname", text: $surNameInput)
                .textFieldStyle(.roundedBorder)
                .padding(4)
                .background(focusName == .surName ? Color(white: 0.9) : .white)
                .focused($focusName, equals: .surName)
            HStack {
                Button("Save") {
                    title = nameInput + " " + surNameInput
                    //Keyboard closes and remove the focus
                    focusName = nil
                }
            }
            Spacer()
        }.padding()
    }
    
    
    // Only save if the condition of empty string is match
    func saveTheFilledNameAndSurName() -> some View {
        
        VStack(spacing: 100) {
            
            Text(titleName)
                .lineLimit(1)
                .padding()
                .background(Color.yellow)
            TextField("Insert Name", text: $nameInput)
                .textFieldStyle(.roundedBorder)
                .padding(4)
                .background(focusName == .name ? Color(white: 0.9) : .white)
                .focused($focusName, equals: .name)
            TextField("Insert Surnane", text:$surNameInput)
                .textFieldStyle(.roundedBorder)
                .padding(4)
                .background(focusName == .surName ? Color(white: 0.9) : .white)
                .focused($focusName, equals: .surName)
            
            HStack {
                Button("Save") {
                    
                    let tempName = nameInput.trimmingCharacters(in: .whitespaces)
                    let tempSurName = surNameInput.trimmingCharacters(in: .whitespaces)
                    
                    if !tempName.isEmpty && !tempSurName.isEmpty {
                        titleName = tempName + " " + tempSurName
                        focusName = nil
                    }
                }
            }
            Spacer()
        }.padding()
    }
    
    func displayDisabledButtonUntillBothNonEmptyField() -> some View {
        VStack(spacing: 10) {
            Text(titleName)
                .lineLimit(1)
                .padding()
                .background(.yellow)
            
            TextField("Insert Name", text: $nameInput)
                .textFieldStyle(.roundedBorder)
                .padding(4)
                .background(focusName == .name ? Color(white: 0.9) : .white)
                .focused($focusName, equals: .name)
            TextField("Insert Surname", text: $surNameInput)
                .textFieldStyle(.roundedBorder)
                .padding(4)
                .background(focusName == .surName ? Color(white: 0.9) : .white)
                .focused($focusName, equals: .surName)
            HStack {
                
                Button("Save") {
                    let tempName = nameInput.trimmingCharacters(in: .whitespaces)
                    let tempSurName = surNameInput.trimmingCharacters(in: .whitespaces)
                    
                    if !tempName.isEmpty && !tempSurName.isEmpty {
                        
                        title = tempName + "" + tempSurName
                        focusName = nil
                    }
                }.disabled(nameInput.isEmpty || surNameInput.isEmpty)
            }
            Spacer()
        }.padding()
    }
    
    func limitTheCharacterInName() -> some View {
        
        VStack(spacing: 10) {
            Text(titleName)
                .lineLimit(1)
                .padding()
                .background(.yellow)
            
            TextField("Insert Name", text: $nameInput)
                .textFieldStyle(.roundedBorder)
                .padding(4)
                .background(focusName == .name ? Color(white: 0.9) : .white)
                .focused($focusName, equals: .name)
                .onChange(of: nameInput, initial: false) { oldValue, newValue in
                    
                    if newValue.count > 10 {
                        nameInput = String(newValue.prefix(10))
                    }
                }
            
            TextField("Insert Surname", text: $surNameInput)
                .textFieldStyle(.roundedBorder)
                .padding(4)
                .background(focusName == .surName ? Color(white: 0.9) : .white)
                .focused($focusName, equals: .surName)
                .onChange(of: surNameInput, initial: false) { oldValue, newValue in
                    if newValue.count > 15 {
                        surNameInput = String(newValue.prefix(15))
                    }
                }
            
            HStack {
                Spacer()
                Button("Save") {
                    let tempName = nameInput.trimmingCharacters(in: .whitespaces)
                    let tempSurName = surNameInput.trimmingCharacters(in: .whitespaces)
                    
                    if !tempName.isEmpty && !tempSurName.isEmpty {
                        titleName = tempName + " " + tempSurName
                        focusName = nil
                    }
                }
            }
            .disabled(nameInput.isEmpty || surNameInput.isEmpty)
        }
    }
    
    func enterOnlyNumberInput() -> some View {
       
        return VStack(spacing: 10) {
            Text(titleVal)
                .padding()
                .background(.yellow)
            
            TextField("Insert Number", text: $numberInputVal)
                .textFieldStyle(.roundedBorder)
                .padding(4)
                .keyboardType(.numbersAndPunctuation)
                .onChange(of: numberInputVal, initial: false) { old, value in
                    if !value.isEmpty && Int(value) == nil {
                        numberInputVal = old
                    }
                }
            
            HStack {
                Spacer()
                Button("Save") {
                    
                    print("the value of number input val \(numberInputVal)")
                    titleVal = numberInputVal
                    numberInputVal = ""
                }
                Spacer()
            }
        }.padding()
        
    }
    
    func displayMultilineText() -> some View {
        @State var text: String = ""
        
        return TextField("Insert Text", text: $text, axis: .vertical)
            .textFieldStyle(.roundedBorder)
            .padding(20)
            .lineLimit(15)
    }
    
    func enterDataInsecureTextfield() -> some View {
        @State var pass: String = ""
        
        return VStack(spacing: 15) {
            
            Text(pass)
                .padding()
            SecureField("Insert password", text: $pass)
                .textFieldStyle(.roundedBorder)
            Spacer()
        }.padding()
    }
    
    func createTheTextEditorView() -> some View {
        @State var text: String = ""
        
        return TextEditor(text: $text)
            .multilineTextAlignment(.leading)
            .lineSpacing(10)
            .autocorrectionDisabled()
            .padding(10)
        
    }
    
    func assignTitle() {
        title = titleInput
        titleInput = ""
    }
}

#Preview {
    ContentView()
}
