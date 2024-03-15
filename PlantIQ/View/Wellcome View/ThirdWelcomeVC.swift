//
//  ThirdWelcomeVC.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 22/02/2024.
//

import UIKit

class ThirdWelcomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func getStartedBtnAction(_ sender: Any) {
        let sb = UIStoryboard (name: "Main", bundle: nil)
        let homeScreen = sb.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        homeScreen.modalTransitionStyle = .flipHorizontal
        self.present(homeScreen, animated: true, completion: nil)
    }
    

}
