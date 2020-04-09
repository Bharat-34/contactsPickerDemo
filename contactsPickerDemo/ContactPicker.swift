//
//  File.swift
//  contactsPickerDemo
//
//  Created by Bharat on 08/04/20.
//  Copyright © 2020 Bharat. All rights reserved.
//

import SwiftUI
import ContactsUI
import UIKit

// Minimal version


struct contactPicker: UIViewControllerRepresentable {
   
    @Binding var isVisible:Bool
    @Binding var pickedContactImage:Data?
    @Binding var pickedContactNumber:String
    @Binding var pickedContactName:String
        
    func makeCoordinator() -> contactPicker.coordinator {
        
        coordinator(isVisibile: $isVisible, image: $pickedContactImage, pickedContactNumber: $pickedContactNumber, pickedContactName: $pickedContactName)
       }
        
    func makeUIViewController(context: Context) -> CNContactPickerViewController {
           let vc = CNContactPickerViewController()
           vc.delegate = context.coordinator
           return vc
       }
      
      func updateUIViewController(_ uiViewController: CNContactPickerViewController, context: UIViewControllerRepresentableContext<contactPicker>) {}
      
    
   
    class coordinator: NSObject,CNContactPickerDelegate,UINavigationControllerDelegate {
        
        @Binding var isVisibile:Bool
        @Binding var pickedContactImge:Data?
        @Binding var pickedContactNumber:String
        @Binding var pickedContactName:String
               
        init(isVisibile: Binding<Bool>, image: Binding<Data?>, pickedContactNumber: Binding<String>, pickedContactName: Binding<String>) {
                   _isVisibile = isVisibile
                    _pickedContactImge = image
                    _pickedContactNumber = pickedContactNumber
                    _pickedContactName = pickedContactName
               }
        
        func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
               print(contact.phoneNumbers)
               let numbers = contact.phoneNumbers.first
               print((numbers?.value)?.stringValue ?? "")
                pickedContactNumber = (numbers?.value.stringValue)!
                pickedContactName = contact.givenName
                pickedContactImge = contact.imageData
                isVisibile = true
            
           }
        
        func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
            isVisibile = false
        }

    }
    
}
