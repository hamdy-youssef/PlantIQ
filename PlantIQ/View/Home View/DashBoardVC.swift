//
//  DashBoardVC.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 03/03/2024.
//

import UIKit
import SwiftUI

class DashBoardVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addUIHostingController()
        // Do any additional setup after loading the view.
    }
    
    func addUIHostingController() {
        let dashboardView = DashBoardContentView1()
        let hostingController = UIHostingController(rootView: dashboardView)
        // Add the UIHostingController's view as a subview
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.didMove(toParent: self)
    }
    
    
}
