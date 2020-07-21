//
//  DrProfile.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 3/30/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation
import UIKit

extension DrProfileVC : UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            self.profileImg.image = image
        }else{
            self.showAlert(title: "Error".localized(), message: "Error image".localized(), okAction: "Try Again!!".localized())
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension DrProfileVC {
    
    func handleChangePhoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        let actionSheet = UIAlertController(title: "Choose a source".localized(), message: "", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera".localized(), style: .default, handler: { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            }else{
                self.showAlert(title: "OhNo".localized(), message: "Sorry".localized(), okAction: "Ok".localized())
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library".localized(), style: .default, handler: { (action) in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "CancelTitle".localized(), style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
  
}
