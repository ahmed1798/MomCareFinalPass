//
//  CustomTabBar.swift
//  MomCare
//
//  Created by Eissa on 3/31/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    let lang = Language.currentLanguage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        createTabBar()
    }
    
    // Mark: - func that create TabBarController
    func createTabBar() {
        
        let moreVc = MoreVC(nibName: "MoreVC", bundle: nil)
        let toolVc = ToolsVC(nibName: "ToolsVC", bundle: nil)
        let homeVc = HomeVC(nibName: "HomeVC", bundle: nil)
        let photoVc = PhotoAlbumVC(nibName: "PhotoAlbumVC", bundle: nil)
        let medicalVc = MedicalGuideVC(nibName: "MedicalGuideVC", bundle: nil)
        
        if lang == "en" {
            let tabIcon1 = UITabBarItem(title: "Medical Guide", image: UIImage(named: "book"), selectedImage: nil)
            let tabIcon2 = UITabBarItem(title: "Photo Album", image: UIImage(named: "image"), selectedImage: nil)
            let tabIcon3 = UITabBarItem(title: "Trip Pregnancy", image: UIImage(named: ""), selectedImage: nil)
            let tabIcon4 = UITabBarItem(title: "Tools", image: UIImage(named: "document"), selectedImage: nil)
            let tabIcon5 = UITabBarItem(title: "More", image: UIImage(named: "more"), selectedImage: nil)
            
                 moreVc.tabBarItem = tabIcon5
                 toolVc.tabBarItem = tabIcon4
                 homeVc.tabBarItem = tabIcon3
                 photoVc.tabBarItem = tabIcon2
                 medicalVc.tabBarItem = tabIcon1
            
            let tabControllers = [medicalVc, photoVc, homeVc, toolVc, moreVc]
            self.tabBarController?.setViewControllers(tabControllers, animated: true)
            self.tabBar.tintColor = #colorLiteral(red: 0.2973757386, green: 0.8578762412, blue: 0.8900747895, alpha: 1)
            self.tabBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.viewControllers = tabControllers
        }
        else {
            let arTabIcon5 = UITabBarItem(title: "المزيد", image: UIImage(named: "more"), selectedImage: nil)
            let arTabIcon4 = UITabBarItem(title: "الادوات", image: UIImage(named: "document"), selectedImage: nil)
            let arTabIcon3 = UITabBarItem(title: "رحله الحمل", image: UIImage(named: ""), selectedImage: nil)
            let arTabIcon2 = UITabBarItem(title: "البوم الصور", image: UIImage(named: "image"), selectedImage: nil)
            let arTabIcon1 = UITabBarItem(title: "الدليل الطبي", image: UIImage(named: "book"), selectedImage: nil)
            
                 moreVc.tabBarItem = arTabIcon5
                 toolVc.tabBarItem = arTabIcon4
                 homeVc.tabBarItem = arTabIcon3
                 photoVc.tabBarItem = arTabIcon2
                 medicalVc.tabBarItem = arTabIcon1
            
            let tabControllers = [medicalVc, photoVc, homeVc, toolVc, moreVc]
            self.tabBarController?.setViewControllers(tabControllers, animated: true)
            self.tabBar.tintColor = #colorLiteral(red: 0.2973757386, green: 0.8578762412, blue: 0.8900747895, alpha: 1)
            self.tabBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.viewControllers = tabControllers
        }
    }
    
    // M/Users/eissa/Desktop/BC-master/MomCare/Scenes/View/Controllers/Gedamy/Tools/Controllers/ToolsVC.swiftark: - func of delegate of TabBarController
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

        return true
    }
}
