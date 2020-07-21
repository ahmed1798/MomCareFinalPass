//
//  SettingsVC.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 3/31/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var backBu: LocalizableButton!
    @IBOutlet weak var privacyBu: LocalizableButton!
    @IBOutlet weak var helpBu: LocalizableButton!
    @IBOutlet weak var langBu: LocalizableButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Localizer.backBuLocalized(sender: privacyBu, arImg: "arrow_open", enImg: "forward")
        Localizer.backBuLocalized(sender: helpBu, arImg: "arrow_open", enImg: "forward")
        Localizer.backBuLocalized(sender: langBu, arImg: "arrow_open", enImg: "forward")
        Localizer.backBuLocalized(sender: backBu, arImg: "right_arrow", enImg: "arrow_pointt")
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func backBuTapped(_ sender: UIButton) {
        handlePushSegue(viewController: MoreVC.self)
    }
    
    @IBAction func changeLanguageBtn(_ sender: Any) {
        handlePushSegue(viewController: ChangeLanguageVC.self)
    }
    
    
    
}
