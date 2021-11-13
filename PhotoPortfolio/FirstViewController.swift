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
        let images = Array(1...9).map {"image\($0)"}
        models = images.compactMap {
            return Model.init(imageName: $0, height: CGFloat.random(in: 50...600))
        }
        
       // view.backgroundColor = #colorLiteral(red: 0.2952214777, green: 0.6588315964, blue: 0.6760896444, alpha: 1)
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self

        
        
        
     
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
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(
        identifier: nil, previewProvider: nil
        )
        {_ in
            let open = UIAction(title: "Open", image: UIImage(systemName: "link"),
                                identifier: nil, discoverabilityTitle: nil,
                                state: .off) {_ in print("Tapped open")}
     //       let open = UIImage(named: "image\(indexPath.row)")
            
            
            return UIMenu(
                title: "", image: nil, identifier: nil, options: UIMenu.Options.displayInline, children: [open]
            )
        }
        return config
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let selectedItem = sender as? String else {
//            return
//        }
//        if segue.identifier == "detail" {
//            guard let destinationVC = segue.destination as?
//                    ZoomViewController else {
//                return
//            }
//            destinationVC.selectedPhoto = selectedItem
//        }
//    }
}
