//
//  HomeVC Extention.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 15/03/2024.
//

import Foundation
import UIKit

extension HomeVC {
    
    func navigateToTab(index: Int) {
        guard let tabBarController = tabBarController, tabBarController.viewControllers?.count ?? 0 > 0 else {
            return
        }
        // Set the selected index to 0 to go to the first tab
        tabBarController.selectedIndex = index
    }
    
    func addDashboardToSubView() {
        if let childVC = storyboard?.instantiateViewController(withIdentifier: "DashBoardVC") as? DashBoardVC {
            addChild(childVC)
            var frame = dashBoardView.bounds
            frame.origin.x = 0
            frame.origin.y = -200
            childVC.view.frame = frame
            dashBoardView.addSubview(childVC.view)
            childVC.didMove(toParent: self)
            self.dashoard = childVC
        }
    }
    
    func setUpNavigationController() {
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        tabBarController?.tabBar.barTintColor = UIColor.white
    }
    
}
