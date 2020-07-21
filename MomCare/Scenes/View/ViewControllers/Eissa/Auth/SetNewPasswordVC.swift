//
//  SetNewPasswordVC.swift
//  MomCare
//
//  Created by Eissa on 4/8/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

protocol SetNewPasswordProtocol: class {
    
    func setPassword(password: String)
    func setConfirmPassword(confirmPassword: String)
    func getPassword() -> String
    func getConfirmPassword() -> String
    func pushViewController()
}

class SetNewPasswordVC: UIViewController {

    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var showPassword: UIButton!
    @IBOutlet weak var showConfirmPassword: UIButton!
    @IBOutlet weak var nextView: UIButton!
    @IBOutlet weak var prevView: UIButton!
    
    var setNewPasswordPresenter: SetNewPasswordPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.logoImg.image = UIImage(named: "OBJECTS-1")
        self.nextView.setBackgroundImage(UIImage(named: "Next"), for: .normal)
        self.prevView.setBackgroundImage(UIImage(named: "Back"), for: .normal)
        self.showPassword.setBackgroundImage(UIImage(named: "Password-View"), for: .normal)
        self.showConfirmPassword.setBackgroundImage(UIImage(named: "Password-View"), for: .normal)
        setNewPasswordPresenter = SetNewPasswordPresenter(setNewPassword: self)
    }

    // Mark: - func of showing and hiding user password
    func showUserPassword() {
        
        if self.passwordTF.text?.count != 0 {
            
            if passwordTF.isSecureTextEntry == true {
                
                // show password
                passwordTF.isSecureTextEntry = false
                self.showPassword.setBackgroundImage(UIImage(named: "hidden"), for: .normal)
            }
            else {
                // hide password
                passwordTF.isSecureTextEntry = true
                self.showPassword.setBackgroundImage(UIImage(named: "Password-View"), for: .normal)
            }
        }
        else {
            Alert.showErrorAlert(title: "Nothing to show please enter password\n", body: "")
        }
    }
    
    // Mark: - func of showing and hiding user confirm password
    func showUserConfirmPassword() {
        
        if self.confirmPasswordTF.text?.count != 0 {
            
            if confirmPasswordTF.isSecureTextEntry == true {
                
                // show password
                confirmPasswordTF.isSecureTextEntry = false
                self.showConfirmPassword.setBackgroundImage(UIImage(named: "hidden"), for: .normal)
            }
            else {
                // hide password
                confirmPasswordTF.isSecureTextEntry = true
                self.showConfirmPassword.setBackgroundImage(UIImage(named: "Password-View"), for: .normal)
            }
        }
        else {
            Alert.showErrorAlert(title: "Nothing to show please enter confirm password\n", body: "")
        }
    }

    @IBAction func nextButton(_ sender: Any) {
        self.setNewPasswordPresenter.setNewPassword()
    }
    @IBAction func PrevButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func showPasswordBtn(_ sender: Any) {
        showUserPassword()
    }
    
    @IBAction func showConfirmPasswordBtn(_ sender: Any) {
        showUserConfirmPassword()
    }
}

// Mark: - adapt this class to the protocol and handle the protocol's functions
extension SetNewPasswordVC: SetNewPasswordProtocol {
    
    func setPassword(password: String) {
        self.passwordTF.text = password
    }
    
    func setConfirmPassword(confirmPassword: String) {
        self.confirmPasswordTF.text = confirmPassword
    }
    
    func getPassword() -> String {
        return passwordTF.text ?? ""
    }
    
    func getConfirmPassword() -> String {
        return confirmPasswordTF.text ?? ""
    }
    
    func pushViewController() {
        
        let alert = Alert.miAlert(msg: "Password changed successfully")
        alert.presentOn(self)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            alert.dismiss(animated: true, completion: nil)
            let vc = LoginVC(nibName: "LoginVC", bundle: nil)
            self.view.window?.rootViewController = vc
        }
    }
}
