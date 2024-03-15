//
//  Plant.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 26/02/2024.
//

import Foundation
import UIKit

struct Plant {
    var plantImage: String
    var plantTitle: String
    var PlantDescription: String
    var subTitle: String
    
    static func setPlantData() -> [Plant]{
        let arrayOfPlants  = [Plant(plantImage: "AloeVera", plantTitle: "Aloe Vera", PlantDescription: "Known for its medicinal properties, aloe vera is a succulent with thick, fleshy leaves that contain a soothing gel. It prefers bright indirect light and occasional watering.", subTitle: "Aloe barbadensis miller"),
                              
                              Plant(plantImage: "BostonFern", plantTitle: "Boston Fern", PlantDescription: "This classic fern is prized for its delicate, feathery fronds that cascade gracefully over the sides of pots. Boston ferns require high humidity and indirect light to thrive indoors.", subTitle: "Nephrolepis exaltata"),
                              
                              Plant(plantImage: "ChineseMoneyPlant", plantTitle: "Chinese Money Plant", PlantDescription: "With its unique coin-shaped leaves and upright growth habit, the Chinese money plant is a charming addition to any indoor space. It prefers bright, indirect light and regular watering.", subTitle: "Pilea peperomioides"),
                              
                              Plant(plantImage: "FiddleLeafFig", plantTitle: "Fiddle Leaf Fig", PlantDescription: "This popular houseplant features large, violin-shaped leaves that add a touch of elegance to any room. Fiddle leaf figs thrive in bright, indirect light and require regular watering.", subTitle: "Ficus lyrata"),
                              
                              Plant(plantImage: "PeaceLily", plantTitle: "Peace Lily", PlantDescription: "This elegant plant features dark green foliage and white flowers. Peace lilies are great for improving indoor air quality and are relatively low maintenance.", subTitle: "Spathiphyllum wallisii"),
                              
                              Plant(plantImage: "Philodendron", plantTitle: "Philodendron", PlantDescription: "There are various species of philodendron, but many are cherished for their attractive foliage and easy care. They can tolerate low light and infrequent watering, making them ideal for beginners.", subTitle: "Philodendron spp"),
                              
                              Plant(plantImage: "Pothos", plantTitle: "Pothos", PlantDescription: "Also known as devil's ivy, pothos is a trailing plant with heart-shaped leaves that come in various shades of green, white, and yellow. It's incredibly adaptable and can thrive in a range of lighting conditions", subTitle: "Epipremnum aureum"),
                              
                              Plant(plantImage: "SnakePlant", plantTitle: "Snake Plant", PlantDescription: "A hardy plant with long, sword-shaped leaves that have striking variegation. Snake plants are known for their air-purifying properties and ability to thrive in low light conditions", subTitle: "Sansevieria trifasciata"),
                              
                              Plant(plantImage: "SpiderPlant", plantTitle: "Spider Plant", PlantDescription: "Characterized by arching green and white striped leaves, spider plants are easy to grow and produce small white flowers. They are excellent for hanging baskets or as tabletop plants.", subTitle: "Chlorophytum comosumx"),
                              
                              Plant(plantImage: "ZZPlant", plantTitle: "ZZ Plant", PlantDescription: "With its glossy, dark green leaves, the ZZ plant is a resilient choice for indoor spaces. It can tolerate low light and infrequent watering, making it perfect for busy plant owners.", subTitle: "Zamioculcas zamiifolia")]
        return arrayOfPlants
    }
}

class TextField: UITextField {

    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
