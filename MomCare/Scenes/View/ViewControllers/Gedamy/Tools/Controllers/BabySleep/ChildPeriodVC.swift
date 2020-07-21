//
//  ChildPeriodVC.swift
//  MomCare
//
//  Created by Eissa on 5/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class ChildPeriodVC: UIViewController {
    
    @IBOutlet weak var modeTextView: UITextView!
    @IBOutlet weak var backBu: LocalizableButton!
    @IBOutlet weak var titleLbl: LocalizableLabel!
    @IBOutlet weak var sleepTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Localizer.backBuLocalized(sender: backBu, arImg: "next-1", enImg: "arrow_point")
        self.titleLbl.text = self.titleName
        self.modeTextView.text = modeText
        self.sleepTextView.text = sleepText
        
    }
    
    var titleName = ""
    var modeText = ""
    var sleepText = ""
    
    
    
    @IBAction func backBuTapped(_ sender: LocalizableLabel) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
