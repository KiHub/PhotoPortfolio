//
//  ViewController.swift
//  PhotoPortfolio
//
//  Created by  Mr.Ki on 11.11.2021.
//

import RAMAnimatedTabBarController
import UIKit

//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//     //   let tabBar = RAMAnimatedTabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
//        
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50 ))
//
//        view.addSubview(button)
//        button.backgroundColor = .systemGray2
//        button.center = view.center
//        button.setTitle("Hello", for: .normal)
//        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//        button.layer.cornerRadius = 20
//        button.layer.shadowColor = #colorLiteral(red: 0.2952214777, green: 0.6588315964, blue: 0.6760896444, alpha: 1)
//        button.layer.shadowRadius = 10
//        button.layer.shadowOpacity = 0.8
//        button.layer.shadowOffset = CGSize(width: 7, height: 6)
//        button.setTitleColor(#colorLiteral(red: 0.01190118678, green: 0.2668929398, blue: 0.2860792279, alpha: 1), for: .normal)
//        view.backgroundColor = .black
//        
//        
//        
//        
//    }
//    @objc func didTapButton() {
//        let tabBarVC = CustomTabBarController()
//        present(tabBarVC, animated: true)
//        
//        
//    }
//
//}

class CustomTabBarController: RAMAnimatedTabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

        tabBar.tintColor = #colorLiteral(red: 0.7732355595, green: 0.8179653287, blue: 0.8506916165, alpha: 1)
        tabBar.barTintColor = .darkGray
        tabBar.layer.cornerRadius = 20
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.layer.masksToBounds = true
        tabBar.barTintColor = #colorLiteral(red: 0.1882352941, green: 0.2666666667, blue: 0.3058823529, alpha: 1)
        
        
        
     
       
    }
    
    
    
    func configure()  {
        
        let vc1 = UIViewController()
        let vc2 = SecondViewController()
        
        
     
        
        vc1.view.backgroundColor = .systemGreen
      
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50 ))
        
        vc1.view.addSubview(button)
        
     

        
        vc1.tabBarItem = RAMAnimatedTabBarItem(title: nil, image: UIImage(systemName: "camera.on.rectangle.fill"), tag: 1)
        
        (vc1.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMBounceAnimation()
        (vc1.tabBarItem as? RAMAnimatedTabBarItem)?.iconColor = #colorLiteral(red: 0.2952214777, green: 0.6588315964, blue: 0.6760896444, alpha: 1)
        
        
        
        vc2.tabBarItem = RAMAnimatedTabBarItem(title: nil, image: UIImage(systemName: "mail.fill"), tag: 2)
        
        (vc2.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMRightRotationAnimation()
        (vc2.tabBarItem as? RAMAnimatedTabBarItem)?.iconColor = #colorLiteral(red: 0.2952214777, green: 0.6588315964, blue: 0.6760896444, alpha: 1)
      
        
        setViewControllers([vc1, vc2], animated: false)
    }
    
}
