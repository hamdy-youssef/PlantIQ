//
//  HomeVC.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 22/02/2024.
//

import UIKit

class HomeVC: UIViewController, VCProtocoL {
    
    @IBOutlet var dashBoardView: UIView!
    
    @IBOutlet var contentView: UIView!
    
    
    //    var tabBarController: UITabBarController?
    var dashoard: DashBoardVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDashboardToSubView()
        setUpNavigationController()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func exploreDashBoardViewMoreBtn(_ sender: Any) {
        navigateToTab(index: 1)
    }
    
    @IBAction func explorePlanViewMoreBtn(_ sender: Any) {
        navigateToTab(index: 3)
    }
    
}

