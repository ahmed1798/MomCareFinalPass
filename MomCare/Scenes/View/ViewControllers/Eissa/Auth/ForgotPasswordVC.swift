//
//  ForgotPasswordVC.swift
//  MomCare
//
//  Created by Eissa on 4/8/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

protocol ForgotPasswordProtocol: class {
    
    func setPhoneNumber(phoneNum: String)
    func getPhoneNumber() -> String
    func pushViewController()
}

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var nextView: UIButton!
    @IBOutlet weak var prevView: UIButton!

    var forgotPasswordPresenter: ForgotPasswordPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.logoImg.image = UIImage(named: "OBJECTS-1")
        self.nextView.setBackgroundImage(UIImage(named: "Next"), for: .normal)
        self.prevView.setBackgroundImage(UIImage(named: "Back"), for: .normal)
        forgotPasswordPresenter = ForgotPasswordPresenter(forgotPassword: self)
    }

    @IBAction func prevButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButton(_ sender: Any) {
         self.forgotPasswordPresenter.sendPhoneNumber()
    }
}

// Mark: - adapt this class to the protocol and handle the protocol's functions
extension ForgotPasswordVC: ForgotPasswordProtocol {
    
    func setPhoneNumber(phoneNum: String) {
        self.phoneNumberTF.text = phoneNum
    }
    func getPhoneNumber() -> String {
        return self.phoneNumberTF.text ?? ""
    }
    func pushViewController() {
        let vc = EnterCodePasswordVC(nibName: "EnterCodePasswordVC", bundle: nil)
        self.present(vc, animated: true, completion: nil)
    }
}
