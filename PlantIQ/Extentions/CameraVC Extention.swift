//
//  CameraVC Extention.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 15/03/2024.
//

import Foundation
import UIKit
import SwiftUI


extension CameraVC {
    
    func setUpNavigationController() {
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        tabBarController?.tabBar.barTintColor = UIColor.white
    }
    
    func addHostView() {
        let cameraScan = CameraView()
        let hostingController = UIHostingController(rootView: cameraScan)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.didMove(toParent: self)
    }
}
