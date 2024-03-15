//
//  LoginPresenter.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 14/03/2024.
//

import Foundation
import UIKit



class LoginPresenter {
    weak var view: VCProtocoL?
    
    init (view: VCProtocoL) {
        self.view = view
    }
    
   
    
    func goToHomeScreen() {
        let sb = UIStoryboard (name: "Main", bundle: nil)
        let homeScreen = sb.instantiateViewController(withIdentifier: "HomeTabBarVC") as! HomeTabBarVC
        homeScreen.modalTransitionStyle = .flipHorizontal
        view?.present(homeScreen, animated: true, completion: nil)
    }
    
    func goToSignUpScreen() {
        let sb = UIStoryboard (name: "Main", bundle: nil)
        let signUp = sb.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        signUp.modalTransitionStyle = .crossDissolve
        view?.present(signUp, animated: true, completion: nil)
    }
    
    func loginChickUp() {
       
    }
    
}
