//
//  BabyDataPresenter.swift
//  MomCare
//
//  Created by Eissa on 4/20/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import Foundation

class BabyData {
    
    weak var babyDetailsPrt: BabyDetailsProtocol!
    
    init(babyData: BabyDetailsProtocol) {
        self.babyDetailsPrt = babyData
    }
    
    // Mark: - func of validating inputs
    func validateInputs(date: String) -> AuthErrors? {
        
        guard date != "Date of the last menstruation" else {
            return .dateMenstruation
        }
        return nil
    }
    // Mark: - func of register action
    func registerButton() {
        
        // IF FAIL
        if let error = validateInputs(date: babyDetailsPrt.getDateMenstruation()) {
            let lang = Language.currentLanguage()
            if lang == "en" {
                Alert.showErrorAlert(title: "Error", body: error.errorDescription)
            }
            else {
                Alert.showErrorAlert(title: "خطا", body: error.errorDescription)
            }
        }
        else {
            
             // IF SUCCESS ... do register request
            self.babyDetailsPrt.pushViewController()
        }
    }
}
