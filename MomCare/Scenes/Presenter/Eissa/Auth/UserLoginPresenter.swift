//
//  UserLoginPresenter.swift
//  MomCare
//
//  Created by Eissa on 4/2/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import Foundation

class UpdateLoginPresenter: NSObject {
    
    weak var updateUserProtocol: UserLoginProtocol!
    
    init(updateUserLoginProtocol: UserLoginProtocol) {
        
        self.updateUserProtocol = updateUserLoginProtocol
    }
        // Mrak: - func of validating inputs
    func validateInputs(email: String, password: String) -> AuthErrors? {
        
        guard !email.isEmpty  else {
            return .emptyEmail
        }
        guard !password.isEmpty  else {
            return .emptyPassword
        }
        return nil
    }
    
    // Mark: - func of login action
    func loginBtn() {
        // IF FAIL
        if let error = validateInputs(email: updateUserProtocol.getEmail(), password: updateUserProtocol.getPassword()) {
            let lang = Language.currentLanguage()
            if lang == "en" {
                Alert.showErrorAlert(title: "Error", body: error.errorDescription)
            }
            else {
                Alert.showErrorAlert(title: "خطا", body: error.errorDescription)
            }
        }
        else {
            // IF SUCCESS ... do login request
            self.updateUserProtocol.pushViewController()
        }
    }
}
