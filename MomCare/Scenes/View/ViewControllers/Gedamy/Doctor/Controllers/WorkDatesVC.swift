//
//  WorkDatesVC.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 3/30/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

class WorkDatesVC: UIViewController {
    
    @IBOutlet weak var backBu: LocalizableButton!
    @IBOutlet weak var changeTimeStackview: UIStackView!
    @IBOutlet weak var wendesDayBu: UIButton!
    @IBOutlet weak var thrusDayBu: UIButton!
    @IBOutlet weak var thuesDayBu: UIButton!
    @IBOutlet weak var monDayBu: UIButton!
    @IBOutlet weak var sunDayBu: UIButton!
    @IBOutlet weak var saturDayBu: UIButton!
    @IBOutlet weak var wendesTimeBu: LocalizableButton!
    @IBOutlet weak var thrusTimeBu: LocalizableButton!
    @IBOutlet weak var thuesTimeBu: LocalizableButton!
    @IBOutlet weak var monTimeBu: LocalizableButton!
    @IBOutlet weak var sunTimeBu: LocalizableButton!
    @IBOutlet weak var saturTimeBu: LocalizableButton!
    @IBOutlet weak var startTime: UITextField!
    @IBOutlet weak var endTime: UITextField!
    @IBOutlet weak var backLabel: LocalizableLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.creatTimePickerView(textField: startTime)
        self.creatTimePickerView(textField: endTime)
        creatToolBar(text: endTime)
        creatToolBar(text: startTime)
        startTime.inputAccessoryView = toolBar
        endTime.inputAccessoryView = toolBar
        Localizer.backBuLocalized(sender: backBu, arImg: "next-1", enImg: "arrow_point")
        let backTap = UITapGestureRecognizer(target: self, action: #selector(self.dismissview))
        backLabel.isUserInteractionEnabled = true
        backLabel.addGestureRecognizer(backTap)
        self.buState(state: true)
        self.buSelect(state: false)
    }
    
    var toolBar = UIToolbar()
    var todayButton = UIBarButtonItem()
    
    
    @IBAction func backBuTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func selectAllTappedBu(_ sender: UIButton) {
        if sender.currentImage == UIImage(named: "uncheckbox50"){
            sender.setImage(UIImage(named: "checkbox50"), for: .normal)
            self.handleSelectAllButton(image: "checkbox50")
            self.buState(state: false)
        }else{
            sender.setImage(UIImage(named: "uncheckbox50"), for: .normal)
            self.handleSelectAllButton(image: "uncheckbox50")
            self.buState(state: true)
        }
    }
    
    @IBAction func saturDayTappedBu(_ sender: UIButton){
        self.handleSelectedBu(sender, Selectedmage: "checkbox50", unSelectedmage: "uncheckbox50")
        showHideBu(sender: sender, button: saturTimeBu)
    }
    
    @IBAction func sunDayTappedBu(_ sender: UIButton) {
        self.handleSelectedBu(sender, Selectedmage: "checkbox50", unSelectedmage: "uncheckbox50")
        showHideBu(sender: sender, button: sunTimeBu)
    }
    
    @IBAction func monDayTappedBu(_ sender: UIButton) {
        self.handleSelectedBu(sender, Selectedmage: "checkbox50", unSelectedmage: "uncheckbox50")
        showHideBu(sender: sender, button: monTimeBu)
    }
    
    @IBAction func wendesDayTappedBu(_ sender: UIButton) {
        self.handleSelectedBu(sender, Selectedmage: "checkbox50", unSelectedmage: "uncheckbox50")
        showHideBu(sender: sender, button: wendesTimeBu)
    }
    @IBAction func thuesDayTappedBu(_ sender: UIButton) {
        self.handleSelectedBu(sender, Selectedmage: "checkbox50", unSelectedmage: "uncheckbox50")
        showHideBu(sender: sender, button: thuesTimeBu)
    }
    
    @IBAction func thrusDayTappedBu(_ sender: UIButton) {
        self.handleSelectedBu(sender, Selectedmage: "checkbox50", unSelectedmage: "uncheckbox50")
        showHideBu(sender: sender, button: thrusTimeBu)
    }
    
    @IBAction func changeTimeBuTapped(_ sender: UIButton) {
        //self.handlePushSegue(viewController: SaveDrDetailsVC.self)
    }
    
    func buState(state : Bool){
        saturTimeBu.isHidden = state
        sunTimeBu.isHidden = state
        monTimeBu.isHidden = state
        thuesTimeBu.isHidden = state
        wendesTimeBu.isHidden = state
        thrusTimeBu.isHidden = state
    }
    
    func buSelect(state : Bool){
        saturDayBu.isSelected = state
        sunDayBu.isSelected = state
        monDayBu.isSelected = state
        thuesDayBu.isSelected = state
        wendesDayBu.isSelected = state
        thrusDayBu.isSelected = state
        
    }
    
    func showHideBu(sender : UIButton , button : LocalizableButton){
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            button.isHidden = true
        }else{
            button.isHidden = false
        }
    }
}
