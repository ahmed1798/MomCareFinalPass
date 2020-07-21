//
//  PregnancySafetyVC.swift
//  MomCare
//
//  Created by Eissa on 6/7/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
import ImageSlideshow

class PregnancySafetyVC: UIViewController {

    @IBOutlet weak var back: LocalizableButton!
    @IBOutlet weak var symptomsView: UIView!
    @IBOutlet weak var chooseSymptomsView: UIView!
    @IBOutlet weak var symptomsTableView: UITableView!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var diseaseImage: ImageSlideshow!
    @IBOutlet weak var diseaseName: UILabel!
    @IBOutlet weak var noResultLabel: UILabel!
    @IBOutlet weak var tryResultLabel: UILabel!
    @IBOutlet weak var dropDown: UIButton!
    
    fileprivate let tabelCellId = "SymptomsCell"
    let tableNibCell = UINib(nibName: "SymptomsCell", bundle: nil)
    var intialConstraints = [NSLayoutConstraint]()
    var kingFisherData = [KingfisherSource]()
    var chooseSymptom = false
    var slideImageArray = [UIImage(named: "2018_2_24_14_19_22_952-1"), UIImage(named: "Nutrition-Articles---Mother-to-be"), UIImage(named: "Eating-for-a-healthy-pregnancy-resized"), UIImage(named: "2018_2_24_14_19_22_952-1")]
    
    var symptomsArray = ["Pain in the upper right abdomen", "Dark-colored urine", "Obstructive jaundice", "Fever", "Weakness", "Red rash all over the body", "Itching", "The blue color of the white of the eye", "Problems focusing or thinking", "Cold hands and feet", "Chest pain", "Arrhythmia", "shortness of breath", "Feeling weak or more tired than usual", "Fatigue", "Pale or yellow skin", "Pain in the lower back", "Cramps appear in the lower abdomen more than 8 times an hour", "A rash that begins to appear on the face first and then spreads to the neck, chest, and other parts of the body", "Decreased body temperature", "Bronchitis and asthma", "dry cough", "Thick yellow, green, brown or blood-stained mucus", "Belching", "Loss of appetite", "Chills", "Vomiting", "Pain and tenderness in the upper back and sides", "Urine looks like cola or tea", "Bloody urine", " Cloudy urine", "Burning with urination", "Lower urinary tract infection"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.dropDown.setBackgroundImage(UIImage(named: "downarrow"), for: .normal)
        hideView()
        tapGesture()
        self.symptomsTableView.register(tableNibCell, forCellReuseIdentifier: tabelCellId)
        setupTableView(tableView: symptomsTableView)
        Localizer.backBuLocalized(sender: back, arImg: "right_arrow", enImg: "arrow_pointt")
    }
    
    // Mark: - func of setup image slide show
    func setupImageSlide() {
        diseaseImage.slideshowInterval = 3.0
        diseaseImage.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        diseaseImage.contentScaleMode = UIView.ContentMode.scaleToFill
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.2588235294, green: 0.831372549, blue: 0.862745098, alpha: 1)
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        diseaseImage.pageIndicator = pageControl
        diseaseImage.activityIndicator = DefaultActivityIndicator()
        diseaseImage.delegate = self
                self.diseaseImage.setImageInputs([ImageSource(image: UIImage(named: "2018_2_24_14_19_22_952-1")!), ImageSource(image: UIImage(named: "Nutrition-Articles---Mother-to-be")!), ImageSource(image: UIImage(named: "Eating-for-a-healthy-pregnancy-resized")!)])
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(PregnancySafetyVC.didTap))
        diseaseImage.addGestureRecognizer(recognizer)
    }
    
    // Mark: - func of UITapGesture of view
    func tapGesture() {
        let showTap = UITapGestureRecognizer(target: self, action: #selector(dropDownBtn(_:)))
        self.symptomsView.addGestureRecognizer(showTap)
    }
    
    // Mark: - show full image slide when tap on it
    @objc func didTap() {
        let fullScreenController = diseaseImage.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    
    func hideView() {
        self.chooseSymptomsView.isHidden = true
        self.resultView.isHidden = true
    }
    
//    @objc func showView() {
//        self.resultView.isHidden = true
//        let bottomView = self.chooseSymptomsView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30)
//        self.intialConstraints.append(bottomView)
//        NSLayoutConstraint.activate(self.intialConstraints)
//        self.chooseSymptomsView.isHidden = false
//    }
//
    @IBAction func backBtn(_ sender: Any) {
        let vc = TabBarController(nibName: "TabBarController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func cancelBtn(_ sender: Any) {
        if self.chooseSymptom == true {
            self.noResultLabel.isHidden = false
            self.tryResultLabel.isHidden = false
            hideView()
        }
        else {
            self.noResultLabel.isHidden = false
            self.tryResultLabel.isHidden = false
            hideView()
        }
    }
    @IBAction func dropDownBtn(_ sender: Any) {
        self.resultView.isHidden = true
        let bottomView = self.chooseSymptomsView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30)
        self.intialConstraints.append(bottomView)
        NSLayoutConstraint.activate(self.intialConstraints)
        self.chooseSymptomsView.isHidden = false
    }
    @IBAction func saveBtn(_ sender: Any) {
        if self.chooseSymptom == true {
            self.chooseSymptomsView.isHidden = true
            self.noResultLabel.isHidden = true
            self.tryResultLabel.isHidden = true
            self.resultView.isHidden = false
            let topView = self.symptomsView.bottomAnchor.constraint(equalTo: self.resultView.topAnchor, constant: -30)
            self.intialConstraints.append(topView)
            NSLayoutConstraint.activate(self.intialConstraints)
            setupImageSlide()
        }
        else {
            self.chooseSymptomsView.isHidden = true
            self.noResultLabel.isHidden = false
            self.tryResultLabel.isHidden = false
            //Alert.showErrorAlert(title: "No result found", body: "")
        }
    }
}

// Mark: - extension of image slide show delegate
extension PregnancySafetyVC: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("current page:", page)
    }
}
