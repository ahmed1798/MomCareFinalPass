//
//  RoundedButtons.swift
//  MomCare
//
//  Created by Eissa on 4/5/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
@IBDesignable

    class RoundedButton: UIButton {

    @IBInspectable var cornerRaduis: CGFloat = 0.3 {
            didSet {
                self.layer.cornerRadius = cornerRaduis
            }
        }
    @IBInspectable var borderWidth: CGFloat = 0.3 {
            didSet {
                self.layer.borderWidth = borderWidth
            }
        }
    @IBInspectable var borderColor: UIColor? {
            didSet {
                self.layer.borderColor = borderColor?.cgColor
            }
        }
        override func awakeFromNib() {
            self.layer.cornerRadius = cornerRaduis
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = borderColor?.cgColor
            checkforLanguage()
        }
        
        override func prepareForInterfaceBuilder() {
            super.prepareForInterfaceBuilder()
            self.layer.cornerRadius = cornerRaduis
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = borderColor?.cgColor
        }
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

        @objc func checkforLanguage() {
            let lang = Language.currentLanguage()
            
            
            if lang.contains("ar") {
                self.setTitle(_arabicText, for: .normal)
                
            }
            
            //self.titleLabel?.font = UIFont(name: "Cairo", size: self.titleLabel!.font.pointSize)
        }
    }
