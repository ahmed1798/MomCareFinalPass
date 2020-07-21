//
//  ChangeLanguageVC.swift
//  MomCare
//
//  Created by Eissa on 5/10/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class ChangeLanguageVC: UIViewController {

    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var dropDown: UIButton!
    @IBOutlet weak var languageView: RoundedCornerView!
    
    let paragraphStyle = NSMutableParagraphStyle()
    @objc func actionPickerDone() {}
    @objc func actionPickerCancel() {}
    
    var langArray = ["english", "arabic"]
    let lang = Language.currentLanguage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        paragraphStyle.alignment = .center
        checkLanguageTitle()
        tapGesture()
    }
    
    // Mark: - func of check current language
    func checkLanguageTitle() {
        
        if lang == "ar" {
            self.languageLabel.text = "عربي"
        }
        else {
            self.languageLabel.text = "english"
        }
    }
    
    // Mark: - func of UITapGesture of view
    func tapGesture() {
      
        let langTapGesture = UITapGestureRecognizer(target: self, action: #selector(changeLanguage))
        self.languageView.addGestureRecognizer(langTapGesture)
    }

    // Mark: - func of choose diseases
       @objc func changeLanguage() {
        guard let window = UIApplication.shared.keyWindow else {return}
        let actionSheet = UIAlertController()
        // change to arabic
            actionSheet.addAction(UIAlertAction(title: "عربي", style: .default, handler: { (action:UIAlertAction) in
                Language.setAppLanguage(lang: "ar")
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                let vc = TabBarController(nibName: "TabBarController", bundle: nil)
                vc.selectedIndex = 2
                window.rootViewController = vc
            }))
                // change to english
            actionSheet.addAction(UIAlertAction(title: "English", style: .default, handler: { (action:UIAlertAction) in
                Language.setAppLanguage(lang: "en")
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                let vc = TabBarController(nibName: "TabBarController", bundle: nil)
                vc.selectedIndex = 2
                window.rootViewController = vc
            }))
        if lang == "en" {
            actionSheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
            self.present(actionSheet, animated: true, completion: nil)
        }
        else {
            actionSheet.addAction(UIAlertAction(title: "إلغاء", style: .cancel, handler: nil))
            self.present(actionSheet, animated: true, completion: nil)
        }

       }
}
