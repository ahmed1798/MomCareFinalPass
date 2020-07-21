//
//  SetNewPasswordPresenter.swift
//  MomCare
//
//  Created by Eissa on 4/8/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import Foundation

class SetNewPasswordPresenter {
    
    weak var setNewPasswordPrt: SetNewPasswordProtocol!
    
    init(setNewPassword: SetNewPasswordProtocol) {
        
        self.setNewPasswordPrt = setNewPassword
    }
    
    // Mark: - func of validating inputs
    func validateInputs(password: String, confirmPassword: String) -> AuthErrors? {
        
        guard !password.isEmpty else {
            return .emptyPassword
        }
        
        guard !confirmPassword.isEmpty else {
            return .emptyConfirmPassword
        }
        guard password.count >= 6 else {
            return .strongPasswprd
        }
        guard confirmPassword == password else {
            return .matchPassword
        }
        return nil
    }
    
    // Mark: - func of set new password
    func setNewPassword() {
        
        // IS FAIL
        if let error = validateInputs(password: setNewPasswordPrt.getPassword(), confirmPassword: setNewPasswordPrt.getConfirmPassword()) {
            let lang = Language.currentLanguage()
            if lang == "en" {
                Alert.showErrorAlert(title: "Error", body: error.errorDescription)
            }
            else {
                Alert.showErrorAlert(title: "خطا", body: error.errorDescription)
            }
        }
        else {
            // IS SUCCESS ... set new password request
            setNewPasswordPrt.pushViewController()
        }
    }
}
