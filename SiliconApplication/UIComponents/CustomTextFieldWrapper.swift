//
//  CustomTextFieldWrapper.swift
//  SiliconApplication
//
//  Created by Егорио on 18.02.2025.
//

import SwiftUI
import UIKit

struct CustomTextFieldWrapper: UIViewRepresentable {
    
    var placeholder: String
    var image: UIImage?
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> CustomTextField {
        let textField = CustomTextField(placeholder: placeholder, image: image)
        textField.addTarget(context.coordinator, action: #selector(Coordinator.textChanged(_:)), for: .editingChanged)
        return textField
    }
    
    func updateUIView(_ uiView: CustomTextField, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: CustomTextFieldWrapper
        
        init(_ parent: CustomTextFieldWrapper) {
            self.parent = parent
        }
        
        @objc func textChanged(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }
    }
}
