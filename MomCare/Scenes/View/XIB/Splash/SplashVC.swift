//
//  SplashVC.swift
//  MomCare
//
//  Created by Eissa on 7/19/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
import UIView_Shimmer
class SplashVC: UIViewController {

    @IBOutlet weak var logoImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        logoImg.startShimmering()
        logoImg.image = UIImage(named: "LOGO")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            
            let vc = PagerController(transitionStyle: UIPageViewController.TransitionStyle.pageCurl, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal)
            self.present(vc, animated: true, completion: nil)
        }
    }
}

//extension UIView{
//    // For insert layer in Foreground
//    func addBlackGradientLayerInForeground(frame: CGRect, colors:[UIColor]){
//        let gradient = CAGradientLayer()
//        gradient.frame = frame
//        gradient.colors = colors.map{$0.cgColor}
//        self.layer.addSublayer(gradient)
//    }
//    // For insert layer in background
//    func addBlackGradientLayerInBackground(frame: CGRect, colors:[UIColor]){
//        let gradient = CAGradientLayer()
//        gradient.frame = frame
//        gradient.colors = colors.map{$0.cgColor}
//        self.layer.insertSublayer(gradient, at: 0)
//    }
//}
