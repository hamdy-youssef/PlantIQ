//
//  String+trim.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 29/02/2024.
//

import Foundation
import UIKit

extension String {
    var trimm: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
