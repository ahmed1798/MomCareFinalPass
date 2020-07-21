//
//  SavedTVCell.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 4/18/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class SavedTVCell: UITableViewCell {

    @IBOutlet weak var babyOrder: LocalizableLabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var saveBu: UIButton!
    @IBOutlet weak var saveView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = 5.0
        saveView.layer.cornerRadius = 10.0
    }
    @IBAction func savedBuTapped(_ sender: UIButton) {
        
    }
    
}
