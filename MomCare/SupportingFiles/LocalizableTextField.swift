//
//  LocalizableTextField.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 6/30/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class LocalizableTextField: SkyFloatingLabelTextField {
    private var _arabicText = ""
    //private var _englishText = ""
    @IBInspectable var arabicText : String {
        set(value){
            _arabicText = value
        }
        get {
            return _arabicText
        }
    }
    //    @IBInspectable var englishText : String  {
    //        set(value){
    //            _englishText = value
    //        }
    //        get{
    //            return _englishText
    //        }
    //    }
    override func awakeFromNib() {
        super.awakeFromNib()
        NotificationCenter.default.addObserver(self, selector: #selector(checkforLanguage), name: NSNotification.Name("checkForLang"), object: nil)
        checkforLanguage()
    }
    @objc func checkforLanguage() {
        let lang = Language.currentLanguage()
        if lang.contains("ar") {
            let rightParagraphStyle = NSMutableParagraphStyle()
            rightParagraphStyle.alignment = .right
            let attributedPlaceholder = NSAttributedString(string: _arabicText, attributes: [NSAttributedString.Key.paragraphStyle: rightParagraphStyle])
            self.textAlignment = .right
            self.attributedPlaceholder = attributedPlaceholder
            self.titleLabel.textAlignment = .right
        }
        //        else{
        //            let leftParagraphStyle = NSMutableParagraphStyle()
        //            leftParagraphStyle.alignment = .left
        //            let attributedPlaceholder = NSAttributedString(string: _englishText, attributes: [NSAttributedString.Key.paragraphStyle: leftParagraphStyle])
        //            self.textAlignment = .left
        //            self.attributedPlaceholder = attributedPlaceholder
        //
        //        }
        //        self.font = UIFont(name: "Cairo", size: self.font!.pointSize)
    }
}
