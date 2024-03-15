//
//  UserDefaultsManager.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 29/02/2024.
//

import Foundation

class UserDefaultsManager {
        
    private static let sharedInstance = UserDefaultsManager ()
    
    static func shared () -> UserDefaultsManager {
        return UserDefaultsManager.sharedInstance
    }
    
    private init() {}
    
    func setIsloggedIn( isloggedIn: Bool) {
        let def = UserDefaults.standard
        def.set(isloggedIn, forKey: UserDefaultsKeys.isLoggedIn)
    }
    
    func getIsLoggedIn() -> Bool? {
        let def = UserDefaults.standard
        if let isLoggedIn = def.object (forKey: UserDefaultsKeys.isLoggedIn) as? Bool {
            if isLoggedIn {
                return true
            }
            return false
        }
        return nil
    }
    
    func saveUserData(user: User) {
        let encoder = JSONEncoder ()
        if let encodedUser = try? encoder.encode (user) {
            let def = UserDefaults.standard
            def.set(encodedUser, forKey: UserDefaultsKeys.userData)
        }
    }
    
    func loadUserData() -> User? {
        let def = UserDefaults.standard
        if let savedUser = def.object(forKey: UserDefaultsKeys.userData) as? Data {
            let decoder = JSONDecoder ( )
            if let loadedUser = try? decoder.decode (User.self, from: savedUser) {
                return loadedUser
            }
        }
        return nil
    }
    
    
}
