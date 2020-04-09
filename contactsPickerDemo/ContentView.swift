//
//  ContentView.swift
//  contactsPickerDemo
//
//  Created by Bharat on 08/04/20.
//  Copyright © 2020 Bharat. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var contactPickker = false
    @State var myImage : Data? = nil
    @State var number = ""
    @State var name = ""
        
    var body: some View {
        
        ZStack{
        VStack{
                Button(action: {
                    self.contactPickker.toggle()
                    print("gfhf")
                }){
                    Text("Add contacts")
                }
            }
            
            if contactPickker{
                contactPicker(isVisible: $contactPickker, pickedContactImage: $myImage, pickedContactNumber: $number, pickedContactName: $name)
            }
                      
        }
           
    }

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
