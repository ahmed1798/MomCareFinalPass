//
//  MoreDrVC.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 4/18/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class MoreDrVC: UIViewController {

    @IBOutlet weak var bottomContentView: UIView!
    @IBOutlet weak var myDetailsBu: LocalizableButton!
    @IBOutlet weak var logoutBu: LocalizableButton!
    @IBOutlet weak var moreBu: LocalizableButton!
    @IBOutlet weak var drLbl: LocalizableLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.bottomContentView.addShadow(location: .top, color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), opacity: 0.2, radius: 5.0)
        self.navigationController?.isNavigationBarHidden = true
        self.logoutBu.layer.borderColor = #colorLiteral(red: 0.8813971008, green: 0.4183354528, blue: 0.4238202558, alpha: 1)
        self.logoutBu.layer.borderWidth = 1.0
        self.logoutBu.layer.cornerRadius = 20.0
        
        let drTap = UITapGestureRecognizer(target: self, action: #selector(self.drLblDidTapped(sender:)))
        self.drLbl.isUserInteractionEnabled = true
        self.drLbl.addGestureRecognizer(drTap)
    }

    @IBAction func myDetailsBuTapped(_ sender: LocalizableButton) {
        
        let vc = DrProfileVC(nibName: "DrProfileVC", bundle: nil)
        let nav = UINavigationController(rootViewController: vc)
        self.view.window?.rootViewController = nav
    }
    
    @IBAction func logoutBuTapped(_ sender: LocalizableButton) {
        self.handlePushSegue(viewController: LoginVC.self)
    }

    @objc func drLblDidTapped(sender: UITapGestureRecognizer) {
       let vc = DrProfileVC(nibName: "DrProfileVC", bundle: nil)
       let nav = UINavigationController(rootViewController: vc)
       self.view.window?.rootViewController = nav
    }
}
