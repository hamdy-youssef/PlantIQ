//
//  ExplorePlantVC Extention.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 15/03/2024.
//

import Foundation
import UIKit

extension ExplorePlantVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func plantTableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       cell.backgroundColor = UIColor.clear
   }
    
    func setUpNavigationController() {
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        tabBarController?.tabBar.barTintColor = UIColor.white
    }
}
