//
//  SavedVC.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 4/18/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class SavedVC: UIViewController {

    @IBOutlet weak var savedTableView: UITableView!
    @IBOutlet weak var backBu : LocalizableButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView(tableView: savedTableView)
        self.backBu.set(image: UIImage(named: "arrow_point"), title: "", titlePosition: .right, additionalSpacing: 10, state: .normal, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        self.navigationController?.isNavigationBarHidden = true
        Localizer.backBuLocalized(sender: backBu, arImg: "right_arrow", enImg: "arrow_pointt")
    }

    var imagesArr = ["2018_2_24_14_19_22_952-1",
    "Eating-for-a-healthy-pregnancy-resized",
    "Nutrition-Articles---Mother-to-be",
    "133-022508-postpartum-depression-common-new-parents_700x400",
    "4126066-2012852796",
    "Nutrition-Articles---Mother-to-be-1"]
    
    var titleArr = ["You and your baby",
    "Breastfeeding",
    "Childbirth",
    "Health of baby and mom",
    "Food and sport",
    "Parents"]
    
     var titlesAr = ["السفر مع الطفل الرضيع",
                     "أفضل الاوقات لحدوث الحمل",
                     "علامات للحمل بولد 10",
                     "صحة الام والطفل",
                     "التغذية والرياضة",
                     "الآباء"]
    
    
    @IBAction func backBuTapped(_ sender: UIButton) {
        let vc = TabBarController(nibName: "TabBarController", bundle: nil)
        vc.selectedIndex = 4
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
