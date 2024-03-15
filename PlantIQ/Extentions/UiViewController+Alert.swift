//
//  UiViewController+Alert.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 29/02/2024.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
        
    }
}
