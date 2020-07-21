//
//  SymptomTableView.swift
//  MomCare
//
//  Created by Eissa on 6/7/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

extension PregnancySafetyVC: UITableViewDataSource {
    
    func setupTableView(tableView : UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        tableView.separatorStyle = .none
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return symptomsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SymptomsCell", for: indexPath) as? SymptomsCell {
            cell.symptomName.text = symptomsArray[indexPath.row]
            cell.selectSymptom = {
                if cell.choose.on == false {
                    self.chooseSymptom = false
                    cell.symptomName.textColor = UIColor.init(red: 94, green: 94, blue: 94)
                }
                else {
                    self.chooseSymptom = true
                    cell.symptomName.textColor = UIColor.init(red: 66, green: 212, blue: 220)
                }
            }
            return cell
        }
        else {
            return SymptomsCell()
        }
    }
}

extension PregnancySafetyVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 50
      }
}

