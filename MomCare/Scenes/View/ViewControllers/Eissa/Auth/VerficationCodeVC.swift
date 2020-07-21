
//
//  VerficationCodeVC.swift
//  MomCare
//
//  Created by Eissa on 4/5/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
import KWVerificationCodeView
import FasterVerificationCode

class VerficationCodeVC: UIViewController {

    @IBOutlet weak var validationCodeView: VerificationCodeView!
    @IBOutlet weak var nextView: UIButton!
    @IBOutlet weak var prevView: UIButton!
    
    
    var isDoctor = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.nextView.setBackgroundImage(UIImage(named: "Next"), for: .normal)
        self.prevView.setBackgroundImage(UIImage(named: "Back"), for: .normal)
        validationCodeView.delegate = self
        self.nextView.isHidden = true
        configureValidationCode()
    }
    
    // Mark: - func of setup verficationcodeview
    func configureValidationCode () {
        
        validationCodeView.setLabelNumber(4)
        validationCodeView.isNumeric = true
        validationCodeView.labelWidth = 50
        validationCodeView.labelTextColor = #colorLiteral(red: 0.2973757386, green: 0.8578762412, blue: 0.8900747895, alpha: 1)
        validationCodeView.labelTintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        validationCodeView.labelFont = UIFont(name: "Cairo-Regular", size: 50)
        validationCodeView.labelErrorColor = .red
    }

    // Mark: - func of go to next screen after successful verification code
     func goToNextPage() {
        
       // self.nextPageView.isHidden = false
      //  self.showProgress()
        let alert = Alert.miAlert(msg: "Your account has been confirmed successfully\n")
         alert.presentOn(self)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            //self.hideProgress()
             alert.dismiss(animated: true, completion: nil)
            if self.isDoctor == false {
                let vc = DrProfileVC(nibName: "DrProfileVC", bundle: nil)
                self.view.window?.rootViewController = vc
            }
            else {
                let vc = TabBarController(nibName: "TabBarController", bundle: nil)
                vc.selectedIndex = 2
                self.view.window?.rootViewController = vc
            }
         }
    }
    
    @IBAction func prevButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func nextButton(_ sender: Any) {
        goToNextPage()
    }
}

// Mark: - extension of VerificationCodeViewDelegate and methods
extension VerficationCodeVC: VerificationCodeViewDelegate
{
    func verificationCodeInserted(_ text: String, isComplete: Bool)
    {
        // CODE IS RIGHT
        if text == "1234"
        {
            self.nextView.isHidden = false
        }
        else
        {
            // CODE IS WRONG
            validationCodeView.showError = true
            Alert.showErrorAlert(title: "The code that you entered is wrong\n", body: "")
        }
    }

    func verificationCodeChanged()
    {
        validationCodeView.showError = false
    }
}
