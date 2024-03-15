//
//  ValidationManager.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 29/02/2024.
//

import Foundation

class ValidationManager {
    
    // MARK: - Singleton
    private static let sharedInstance = ValidationManager ()
    static func shared() -> ValidationManager {
        return ValidationManager.sharedInstance
    }
    
    private init() {}
    
    func isValidEmail(email: String) -> Bool {
        let regex: String = RegexConstants.email
        let predicateFormat = RegexConstants.predicateFormat
        let predicate = NSPredicate (format: predicateFormat, regex)
        if predicate.evaluate (with: email) {
            print("false")
            return false
        }
        print("true")
        return true
    }
    
    func isValidPassword(password: String) -> Bool {
        if password.count < 6 {
            return false
        }
        return true
    }
    
}
