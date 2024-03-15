//
//  PlantDetailsVC.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 27/02/2024.
//

import UIKit

class PlantDetailsVC: UIViewController {

    @IBOutlet var plantImage: UIImageView!
    @IBOutlet var plantTitle: UILabel!
    @IBOutlet var plantDescription: UILabel!
    @IBOutlet var subTitle: UILabel!
    
    var plantImageName: String = ""
    var plantTitleText: String = ""
    var plantDescriptionText: String = ""
    var subTitleText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plantImage.image = UIImage.init(named: plantImageName)
        plantTitle.text = plantTitleText
        plantDescription.text = plantDescriptionText
        subTitle.text = subTitleText
        // Do any additional setup after loading the view.
    }
    

    

}
