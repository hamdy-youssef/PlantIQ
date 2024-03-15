//
//  HomeTabBarVC.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 22/02/2024.
//

import UIKit

class HomeTabBarVC: UITabBarController {
    
    var user: User!

   override func viewDidLoad() {
        super.viewDidLoad()
       UserDefaultsManager.shared().setIsloggedIn(isloggedIn: true)
       
       if let user = UserDefaultsManager.shared().loadUserData() {
       self.user = user
       } else {
           showAlert(title: AlertConstants.errorTitle, message: ErrorMessages.somethingWentWrong)
       }
        // Do any additional setup after loading the view.
    }
    
    
    

}
