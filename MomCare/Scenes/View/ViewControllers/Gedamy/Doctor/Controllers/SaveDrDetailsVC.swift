//
//  SaveDrDetailsVC.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 3/30/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

class SaveDrDetailsVC: UIViewController {

    @IBOutlet weak var backBu: LocalizableButton!
    @IBOutlet weak var saveBu: UIButton!
    @IBOutlet weak var phoneTxtField: LocalizableNorTextField!
    @IBOutlet weak var whatsappTxtField: LocalizableNorTextField!
    @IBOutlet weak var facebookTxtField: LocalizableNorTextField!
    @IBOutlet weak var backLabel: LocalizableLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // next-1 forward
        // arrow_open arrow_point
        Localizer.backBuLocalized(sender: backBu, arImg: "next-1", enImg: "arrow_point")

        self.saveBu.layer.cornerRadius = 20.0
        
        let backTap = UITapGestureRecognizer(target: self, action: #selector(self.dismissview))
        backLabel.isUserInteractionEnabled = true
        backLabel.addGestureRecognizer(backTap)
        setTextFieldData(state: false)
    }
    
    func setTextFieldData(state : Bool) {
        self.phoneTxtField.isUserInteractionEnabled = state
        self.whatsappTxtField.isUserInteractionEnabled = state
        self.facebookTxtField.isUserInteractionEnabled = state
        
    }
    
    
    @IBAction func backBuTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editTimeBuTapped(_ sender: UIButton) {
        self.handlePresentSegue(viewController: WorkDatesVC.self)
    }
    
    @IBAction func editDataBuTapped(_ sender: UIButton) {
        setTextFieldData(state: true)
    }
    
    @IBAction func editAddresBuTapped(_ sender: UIButton) {
        let vc = MapVC(nibName: "MapVC", bundle: nil)
        let nav = UINavigationController(rootViewController: vc)
        self.view.window?.rootViewController = nav
    }
    
    @IBAction func saveBuTapped(_ sender: UIButton) {
        setTextFieldData(state: false)
        self.dismissview()
    }
    
}
