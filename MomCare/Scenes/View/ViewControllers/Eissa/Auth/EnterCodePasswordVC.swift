//
//  EnterCodePasswordVC.swift
//  MomCare
//
//  Created by Eissa on 4/8/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
import CountdownLabel

protocol EnterCodeProtocol: class {
    
    func setCode(code: String)
    func getCode() -> String
    func pushViewController()
}

class EnterCodePasswordVC: UIViewController {

    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var verficationCodeTF: UITextField!
    @IBOutlet weak var countCodeLabel: CountdownLabel!
    @IBOutlet weak var nextView: UIButton!
    @IBOutlet weak var prevView: UIButton!
    
    var enterCodePresenter: EnterCodePasswordPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.logoImg.image = UIImage(named: "OBJECTS-1")
        self.nextView.setBackgroundImage(UIImage(named: "Next"), for: .normal)
        self.prevView.setBackgroundImage(UIImage(named: "Back"), for: .normal)
        enterCodePresenter = EnterCodePasswordPresenter(enterCode: self)
        handleCountLabel()
    }
    
    // Mark: - handle countdownlabel
    func handleCountLabel() {
        self.countCodeLabel.setCountDownTime(minutes: 60)
        self.countCodeLabel.animationType = .Fall
        self.countCodeLabel.start()
    }
    @IBAction func nextButton(_ sender: Any) {
        self.enterCodePresenter.sendCode()
    }
    @IBAction func prevButton(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    @IBAction func resendCode(_ sender: Any) {
        // do resend request
        handleCountLabel() // after success of resending code request
    }
}

// Mark: - adapt this class to the protocol and handle the protocol's functions
extension EnterCodePasswordVC: EnterCodeProtocol {

    func setCode(code: String) {
        self.verficationCodeTF.text = code
    }
    
    func getCode() -> String {
        return self.verficationCodeTF.text ?? ""
    }
    
    func pushViewController() {
        let vc = SetNewPasswordVC(nibName: "SetNewPasswordVC", bundle: nil)
        self.present(vc, animated: true, completion: nil)
    }
}
