//
//  ExplorePlantVC.swift
//  PlantIQ
//
//  Created by Hamdy Youssef on 26/02/2024.
//

import UIKit
import RxSwift
import RxCocoa

class ExplorePlantVC: UIViewController {

    @IBOutlet var plantTableView: UITableView!
    
    let plantArray = Observable.just(Plant.setPlantData())
    let dispseBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableData()
        presentMoreDeatailsOnTap()
        self.plantTableView.backgroundColor = UIColor.white
        setUpNavigationController()
        // Do any additional setup after loading the view.
    }
    
    func setTableData() {
        
        plantArray
            .bind(to: plantTableView
            .rx
            .items(cellIdentifier: "myCell", cellType: PlantTableViewCell.self)) {
                (tv, tableViewItem, cell) in
                cell.plantImageView.image = UIImage(named: tableViewItem.plantImage)
                cell.plantTitle.text = tableViewItem.plantTitle
            }
            .disposed(by: dispseBag)
    }
    
    func presentMoreDeatailsOnTap() {
        plantTableView
            .rx.setDelegate(self)
            .disposed(by: dispseBag)
        
        plantTableView
            .rx
            .modelSelected(Plant.self)
            .subscribe { plantObject in
                let plantVC = self.storyboard?.instantiateViewController(withIdentifier: "PlantDetailsVC") as! PlantDetailsVC
                plantVC.plantImageName = plantObject.plantImage
                plantVC.plantTitleText = plantObject.plantTitle
                plantVC.plantDescriptionText = plantObject.PlantDescription
                plantVC.subTitleText = plantObject.subTitle
                self.present(plantVC, animated: true, completion: nil)
            }
            .disposed(by: dispseBag)
    }

}


