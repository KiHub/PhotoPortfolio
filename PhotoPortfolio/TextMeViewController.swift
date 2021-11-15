//
//  ContactViewController.swift
//  PhotoPortfolio
//
//  Created by  Mr.Ki on 15.11.2021.
//

import UIKit
import MessageUI


class TextMeViewController: UIViewController {
    
    
    @IBOutlet weak var textMeOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let button = UIButton.init(type: .roundedRect)
        let image = UIImageView(image: UIImage(named: "profilePhoto"))
        image.frame = CGRect(x: 100, y: 244, width: 210, height: 210)
        button.frame = CGRect(x: 152, y: 716, width: 110, height: 50)
        button.layer.backgroundColor = UIColor.white.cgColor
        button.setTitle("Text me", for: .normal)
//        button.layer.borderColor = UIColor.black.cgColor
//        button.layer.borderWidth = 1.0
        button.tintColor = .black
        button.layer.cornerRadius = 20
        //  button.layer.shadowColor = UIColor.purple.cgColor
        button.addTarget(self, action: #selector(buttonClicked(_ :)), for: .touchUpInside)
        
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowOffset = CGSize(width:1,height: 2.0)
        button.layer.shadowRadius = 3.5
        button.layer.shadowOpacity = 5.0
        button.layer.shadowOffset = CGSize(width: 3, height: 4)
        button.layer.masksToBounds = false;
        button.layer.shadowPath = UIBezierPath(roundedRect:button.bounds, cornerRadius:button.layer.cornerRadius).cgPath
        
        self.view.addSubview(button)
        self.view.addSubview(image)
        
    }
    
    @objc func buttonClicked(_ : UIButton) {
        print("Hello")
        
        
    }
    
    @IBAction func textMeButtonTapped(_ sender: UIButton) {
    }
    
    func showMailComposer()  {
        
    }
    

}
