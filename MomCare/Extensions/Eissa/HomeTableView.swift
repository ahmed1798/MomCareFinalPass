//
//  HomeTableView.swift
//  MomCare
//
//  Created by Eissa on 4/15/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

extension HomeVC: UITableViewDataSource {
    
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
        return examinationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ExaminationsTableCell", for: indexPath) as? ExaminationsTableCell {
            cell.examinationName.text = self.examinationArray[indexPath.row]
            cell.selectExamination = {
                if self.isSelectedExamination == false {
                    cell.addAlert.setBackgroundImage(UIImage(named: "correct"), for: .normal)
                    cell.addAlertLabel.textColor = UIColor.init(red: 0, green: 191, blue: 43)
                    self.isSelectedExamination = true
                }
                else {
                    cell.addAlert.setBackgroundImage(UIImage(named: "correct-4"), for: .normal)
                    cell.addAlertLabel.textColor = UIColor.init(red: 66, green: 66, blue: 66)
                    self.isSelectedExamination = false
                }
            }
            return cell
        }
        else {
            return ExaminationsTableCell()
        }
    }
}

extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 80
      }
}
