//
//  FirstWelcomeVC.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 20/02/2024.
//

import UIKit

class FirstWelcomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func continueBtnAction(_ sender: Any) {
        let sb = UIStoryboard (name: "Main", bundle: nil)
        let secondScreen = sb.instantiateViewController(withIdentifier: "SecondWelcomeVC") as! SecondWelcomeVC
        secondScreen.modalTransitionStyle = .partialCurl
        self.present(secondScreen, animated: true, completion: nil)
    }
    
    @IBAction func skipBtnAction(_ sender: Any) {
        let sb = UIStoryboard (name: "Main", bundle: nil)
        let homeScreen = sb.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        homeScreen.modalTransitionStyle = .coverVertical
        self.present(homeScreen, animated: true, completion: nil)

    }
}
