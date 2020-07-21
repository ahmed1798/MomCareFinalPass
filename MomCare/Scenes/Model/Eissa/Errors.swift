//
//  Errors.swift
//  MomCare
//
//  Created by Eissa on 4/2/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import Foundation

enum AuthErrors: Error {
    
    case emptyName
    case emptyPhoneNumber
    case emptyEmail
    case emptyPassword
    case invalidEmail
    case invalidPhoneNumber
    case strongPasswprd
    case emptyCity
    case acceptTerms
    case verficationCode
    case emptyConfirmPassword
    case matchPassword
    case dateMenstruation
    
    var errorDescription: String {
        let lang = Language.currentLanguage()
        switch self {
            
        case .emptyName:
            if lang == "en" {
                return "Please enter full name"
            }
            else {
                return "ادخل الاسم بالكامل"
            }
        case .emptyEmail:
            if lang == "en" {
                return "Please enter your E-mail"
            }
            else {
                return "ادخل البريد الالكتروني"
            }
        case .emptyPhoneNumber:
            if lang == "en" {
                return "Please enter phone Number"
            }
            else {
                return "ادخل رقم الموبايل"
            }
        case .emptyPassword:
            if lang == "en" {
                return "Please enter password"
            }
            else {
                return "ادخل كلمه المرور"
            }
        case .emptyCity:
            if lang == "en" {
                return "Please choose city"
            }
            else {
                return "ادخل المدينه"
            }
        case .invalidEmail:
            if lang == "en" {
                return "Please enter a valid E-mail"
            }
            else {
                return "ادخل البريد الالكتروني بطريقه صحيحه"
            }
        case .invalidPhoneNumber:
            if lang == "en" {
                return "Please enter a valid phone number"
            }
            else {
                return "ادخل رقم الموبايل بطريقه صحيحه"
            }
        case .strongPasswprd:
            if lang == "en" {
                return "Short password"
            }
            else {
                return "كلمه المرور قصيره"
            }
        case .acceptTerms:
            if lang == "en" {
                return "You should accept terms amd condition"
            }
            else {
                return "لا بد من الموافقه علي الشروط والاحكام"
            }
        case .verficationCode:
            if lang == "en" {
                return "Please enter verfication code"
            }
            else {
                return "ادخل كودالتحقق"
            }
        case .emptyConfirmPassword:
            if lang == "en" {
                return "Please enter confirm password"
            }
            else {
                return "ادخل تاكيد كلمه المرور الجديده"
            }
        case .matchPassword:
            if lang == "en" {
                return "Password doesn't matches"
            }
            else {
                return "كلمتا المرور غير متطابقه"
            }
        case .dateMenstruation:
            if lang == "en" {
                return "Please enter the last date of menstruation\n"
            }
            else {
                return "ادخلي تاريخ الحيض الاخير"
            }
        }
    }
}
