//
//  BabySleepVC.swift
//  MomCare
//
//  Created by Eissa on 5/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

extension BabySleepVC : UITableViewDataSource{
    
    func setupTableView(tableView : UITableView){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(cell: BabySleepTVCell.self)
        tableView.separatorColor = UIColor.clear
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.childbirthArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BabySleepTVCell", for: indexPath) as? BabySleepTVCell{
            if Language.currentLanguage() == "ar"{
                cell.headerLbl.text = self.childbirthArrAr[indexPath.row]
            }else{
                cell.headerLbl.text = self.childbirthArr[indexPath.row]
            }
            
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
}

extension BabySleepVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ChildPeriodVC(nibName: "ChildPeriodVC", bundle: nil)
        if Language.currentLanguage() == "ar"{
            vc.titleName = self.childbirthArrAr[indexPath.row]
        }else{
            vc.titleName = self.childbirthArr[indexPath.row]
        }
        
        switch indexPath.item {
        case 0:
            if Language.currentLanguage() == "ar"{
                vc.modeText = self.modeSleepArrAr[0]
                vc.sleepText = self.sleepArrAr[0]
            }else{
                vc.modeText = self.modeSleepArr[0]
                vc.sleepText = self.sleepArr[0]
            }
           
        case 1:
            
            if Language.currentLanguage() == "ar"{
                vc.modeText = self.modeSleepArrAr[1]
                vc.sleepText = self.sleepArrAr[1]
            }else{
                vc.modeText = self.modeSleepArr[1]
                vc.sleepText = self.sleepArr[1]
            }
            
        case 2:
            
            if Language.currentLanguage() == "ar"{
                vc.modeText = self.modeSleepArrAr[2]
                vc.sleepText = self.sleepArrAr[2]
            }else{
                vc.modeText = self.modeSleepArr[2]
                vc.sleepText = self.sleepArr[2]
            }
            
        case 3:
            
            if Language.currentLanguage() == "ar"{
                vc.modeText = self.modeSleepArrAr[3]
                vc.sleepText = self.sleepArrAr[3]
            }else{
                vc.modeText = self.modeSleepArr[3]
                vc.sleepText = self.sleepArr[3]
            }
            
        default:
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
