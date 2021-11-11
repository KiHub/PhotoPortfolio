//
//  ViewController.swift
//  PhotoPortfolio
//
//  Created by  Mr.Ki on 10.11.2021.
//

import RAMAnimatedTabBarController
import UIKit



class PortfolioViewController: RAMAnimatedTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }

    func configure()  {
        let vc1 = self
        let vc2 = RAMAnimatedTabBarController()
        
        vc1.view.backgroundColor = .systemOrange
        vc2.view.backgroundColor = .red
        
        vc1.tabBarItem = RAMAnimatedTabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        
        (vc1.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMRotationAnimation()
        
        vc2.tabBarItem = RAMAnimatedTabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 1)
        
        (vc1.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMRotationAnimation()
        
       // setViewControllers([vc1, vc2], animated: false)
    }
    
//    func tabBarConfig() {
//        guard let tabBar = self.tabBarController else {return}
//
//
//
//    }

}

//class CustomTabBarController: RAMAnimatedTabBarController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configure()
//    }
//
//    func configure()  {
//        let vc1 = PortfolioViewController()
//        let vc2 = ContactViewController()
//
//        vc1.view.backgroundColor = .systemGray
//        vc2.view.backgroundColor = .systemBlue
//    }
//}
