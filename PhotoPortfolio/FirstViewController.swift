//
//  SecondViewController.swift
//  PhotoPortfolio
//
//  Created by  Mr.Ki on 11.11.2021.
//

import CHTCollectionViewWaterfallLayout
import UIKit

class FirstViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,
                           CHTCollectionViewDelegateWaterfallLayout {
    
    
    
    private let collectionView: UICollectionView = {
        let layout = CHTCollectionViewWaterfallLayout()
        layout.itemRenderDirection = .leftToRight
        layout.columnCount = 2
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        return collectionView
    }()
    
    struct Model {
        let imageName: String
        let height: CGFloat
    }
    private var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let images = Array(0...9).map {"image\($0)"}
        models = images.compactMap {
            return Model.init(imageName: $0, height: CGFloat.random(in: 50...600))
        }
        
        // view.backgroundColor = #colorLiteral(red: 0.2952214777, green: 0.6588315964, blue: 0.6760896444, alpha: 1)
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
        collectionView.layer.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
        
        
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {
            fatalError()
        }
        cell.configure(image: UIImage(named: models[indexPath.row].imageName))
        
        //MARK: - cell corner radius
        cell.contentView.layer.cornerRadius = 4
        
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        
        cell.layer.shadowColor = UIColor.darkGray.cgColor
        cell.layer.shadowOffset = CGSize(width:1,height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false;
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.size.width/2, height: models[indexPath.row].height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        print(indexPath.item, "item")
        
        // let selectedItem = indexPath.row
        // self.performSegue(withIdentifier: "detail", sender: self)
    }
    
    //    func makeImagePreview() -> UIViewController {
    //            let viewController = UIViewController()
    //
    //            let imageView = UIImageView(image: models[indexPath.row] )
    //            imageView.contentMode = .scaleAspectFit
    //            viewController.view = imageView
    //
    //            imageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: models[indexPath.row].height)
    //
    //            viewController.preferredContentSize = imageView.frame.size
    //            viewController.view.backgroundColor = .clear
    //
    //            return viewController
    //        }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        // let identifier = NSString(string: "image\(indexPath.row)")
        
        //MARK: - preview content configuration
        
        func makeImagePreview() -> UIViewController {
            let viewController = UIViewController()
            
            let imageView = UIImageView(image: UIImage(named: "image\(indexPath.row)"))
            imageView.contentMode = .scaleAspectFill
            viewController.view = imageView
            
            
            
            
            imageView.frame = CGRect(x: 0, y: 0, width: imageView.frame.size.width, height: imageView.frame.size.height)
            
            //    imageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: models[indexPath.row].height)
            
            viewController.preferredContentSize = imageView.frame.size
            viewController.view.backgroundColor = .clear
            
            return viewController
        }
        
        
        let config = UIContextMenuConfiguration(
            
            identifier: nil, previewProvider: makeImagePreview
        )
        {_ in
            
            //MARK: - Preciew menu configuration
            
            //            let open = UIAction(title: "Open", image: UIImage(systemName: "link"),
            //                                identifier: nil, discoverabilityTitle: nil,
            //                                state: .off) {_ in print("Tapped open")}
            
            
            
            return UIMenu(
                title: "", image: nil, identifier: nil, options: UIMenu.Options.displayInline
            )
            
        }
        return config
        
    }
    
    
    
    
    
    
}
