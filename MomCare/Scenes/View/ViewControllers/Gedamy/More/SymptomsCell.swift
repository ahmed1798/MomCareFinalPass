//
//  SymptomsCell.swift
//  MomCare
//
//  Created by Eissa on 6/7/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
import BEMCheckBox

class SymptomsCell: UITableViewCell {

    @IBOutlet weak var symptomName: UILabel!
    @IBOutlet weak var choose: BEMCheckBox!
    var selectSymptom: (()->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.choose.on = false
        self.choose.boxType = .circle
    }
   
    @IBAction func chooseBtn(_ sender: Any) {
        selectSymptom?()
    }
}
