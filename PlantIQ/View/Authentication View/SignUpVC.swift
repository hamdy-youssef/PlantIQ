//
//  SignUpVC.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 29/02/2024.
//

import UIKit

class SignUpVC: UIViewController, VCProtocoL {
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var userNameTextField: UITextField!
    
    @IBOutlet var passwardTextField: UITextField!
    
    @IBOutlet var rePasswardTextField: UITextField!
    
    var alertMessage: String!
    
    lazy var presenter: SignUpPresenter = SignUpPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userNameTextField.addPaddingToTextField()
        self.emailTextField.addPaddingToTextField()
        self.passwardTextField.addPaddingToTextField()
        self.rePasswardTextField.addPaddingToTextField()
        
        presenter.createTable()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Singleton
    private static let sharedInstance = SignUpVC ()
    static func shared() -> SignUpVC {
        return SignUpVC.sharedInstance
    }
    
    @IBAction func alreadyHaveAccountBtnAction(_ sender: Any) {
        presenter.goToLogin()
    }
    
    @IBAction func signUpBtnAction(_ sender: Any) {
        presenter.goToHome()
    }

}



