//
//  TextField.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 14/03/2024.
//

import Foundation
import UIKit

extension UITextField {
    func addPaddingToTextField() {
        let paddingView: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        self.leftView = paddingView;
        self.leftViewMode = .always;
        self.rightView = paddingView;
        self.rightViewMode = .always;
    }
}
