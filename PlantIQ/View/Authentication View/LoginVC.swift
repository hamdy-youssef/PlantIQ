//
//  LoginVC.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 29/02/2024.
//

import UIKit
import SQLite


class LoginVC: UIViewController, VCProtocoL {
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwardTextField: UITextField!
    
    lazy var presenter: LoginPresenter = LoginPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.addPaddingToTextField()
        self.passwardTextField.addPaddingToTextField()
        // Do any additional setup after loading the view.
    }
    
    func isValidatCredentials() -> Bool {
        SQLiteCommands.checkUserDataForLogIn(emaill: emailTextField.text ?? "", password: passwardTextField.text ?? "")
    }
    
    // MARK: - Singleton
    private static let sharedInstance = LoginVC ()
    static func shared() -> LoginVC {
        return LoginVC.sharedInstance
    }
    
    @IBAction func alreadyHaveAcoountBtnAction(_ sender: Any) {
        presenter.goToSignUpScreen()
    }

    @IBAction func loginBtnActtion(_ sender: Any) {
        if isValidatCredentials(){
            presenter.goToHomeScreen()
        } else {
            self.showAlert(title: "Un Valid", message: "Email or Passward Not Correct")
        }
    }
}


