//
//  SigunUpPresenter.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 14/03/2024.
//

import Foundation
import UIKit



class SignUpPresenter {
    weak var view: VCProtocoL?
    
    init (view: VCProtocoL) {
        self.view = view
    }
    
    // MARK: - Connect to database and create table
    func createTable() {
        let database = SQLiteDataBase.shared()
        database.createTable()
    }
    
    // MARK: - Create New User
    private func createNewUser(_ userValues: User) {
        let userAddedToTble = SQLiteCommands.insertRow(userValues)
        
        // email is unique
        if userAddedToTble == true {
//            dismiss(animated: true, completion: nil)
        }else {
            view?.showAlert(title: "Error", message: "This Email Is Already Exist")
        }
        
    }
    
    func isValidEmail(email: String) -> Bool {
        if !email.trimm.isEmpty {
            print("email")
            if ValidationManager.shared().isValidEmail(email: email) {
                print("not valid")
                view?.showAlert (title: "Sorry", message: "please enter valid email!")
                return false
            }
            return true
        } else {
            print(" valid")
            view?.showAlert(title: "Sorry", message: "the email is required!")
            return false
        }
    }
    
    func isValidPassword(password: String) -> Bool {
        if !password.trimm.isEmpty {
            if !ValidationManager.shared().isValidPassword(password: password) {
                view?.showAlert(title: "Sorry", message: "the password should contains at least 6 characters")
                return false
            }
            return true
        }else {
            view?.showAlert(title: "Sorry", message: "the password is required!")
            return false
        }
    }

    func isConfirmedPassword (password: String, confirmedPassword: String) -> Bool {
        if password != confirmedPassword {
            view?.showAlert(title: "Sorry", message: "the password and its confirmation aren't matched!")
            return false
        }
        return true
    }
    
    func validateFields () -> Bool {
        if let email = SignUpVC.shared().emailTextField.text, isValidEmail(email: email), let password = SignUpVC.shared().passwardTextField.text, isValidPassword(password: password), let confirmedPassword = SignUpVC.shared().rePasswardTextField.text, isConfirmedPassword(password: password,confirmedPassword: confirmedPassword) {
            return true
            
        }
    return false
    }
    
    func goToHome(){
        let sb = UIStoryboard (name: "Main", bundle: nil)
        let homeScreen = sb.instantiateViewController(withIdentifier: "HomeTabBarVC") as! HomeTabBarVC
        homeScreen.modalTransitionStyle = .flipHorizontal
        view?.present(homeScreen, animated: true, completion: nil)
    }
    
    func goToLogin() {
        let sb = UIStoryboard (name: "Main", bundle: nil)
        let login = sb.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        login.modalTransitionStyle = .crossDissolve
        view?.present(login, animated: true, completion: nil)
    }
    
    func saveUerData() {
        let id: Int = 0
        let name: String = SignUpVC.shared().userNameTextField.text ?? ""
        let email: String = SignUpVC.shared().emailTextField.text ?? ""
        let passward: String = SignUpVC.shared().passwardTextField.text ?? ""
        
       let userValues = User(id: id, userName: name, email: email, password: passward)
        
        createNewUser(userValues)
        SQLiteCommands.presentRows()
    }
    
    func signUp() {
        if validateFields (){
            guard let userName = SignUpVC.shared().userNameTextField.text, let email = SignUpVC.shared().emailTextField.text, let password = SignUpVC.shared().passwardTextField.text else {return}
            let user = User(userName: userName, email: email, password: password)
            UserDefaultsManager.shared().saveUserData(user: user)
            saveUerData()
            goToHome()
        }
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Wrong!", message: SignUpVC.shared().alertMessage, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
           
        }
        alertController.addAction(okAction)
        view?.present(alertController, animated: true, completion: nil)
    }
    
    
    
}

