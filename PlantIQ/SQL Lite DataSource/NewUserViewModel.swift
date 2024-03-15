//
//  NewUserViewModel.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 02/03/2024.
//

import UIKit

class NewUserViewModel {
    private var userValues: User?
    
    let id: Int?
    let name: String?
    let email: String?
    let passward: String?
    
    init(userValues: User?) {
        self.userValues = userValues
        self.id = userValues?.id
        self.name = userValues?.userName
        self.email = userValues?.email
        self.passward = userValues?.password
    }
}
