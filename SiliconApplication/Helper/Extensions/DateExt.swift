//
//  DateExt.swift
//  SiliconApplication
//
//  Created by Егорио on 22.02.2025.
//

import Foundation

extension Date {
    var greetings: String {
        let hour = Calendar.current.component(.hour, from: self)
        
        switch hour {
        case 6..<12: return "Доброе утро"
        case 12..<18: return "Добрый день"
        case 18..<23: return "Добрый вечер"
        default: return "Доброй ночи"
        }
    }
}
