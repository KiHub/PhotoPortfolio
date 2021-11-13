//
//  ZoomViewController.swift
//  PhotoPortfolio
//
//  Created by  Mr.Ki on 13.11.2021.
//

import UIKit

class ZoomViewController: UIViewController {
    
    var selectedPhoto = ""
    
    
    @IBOutlet weak var imageOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageOutlet.image = UIImage(named: "image\(selectedPhoto)")
        // Do any additional setup after loading the view.
    }
    

    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
