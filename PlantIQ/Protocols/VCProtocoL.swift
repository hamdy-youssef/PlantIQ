//
//  VCProtocole.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 14/03/2024.
//

import Foundation
import UIKit

protocol VCProtocoL: AnyObject {
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
    func showAlert(title: String, message: String)
}
