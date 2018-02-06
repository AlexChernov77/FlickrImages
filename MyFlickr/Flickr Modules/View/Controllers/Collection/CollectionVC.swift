//
//  CollectionVC.swift
//  MyFlickr
//
//  Created by Александр Чернов on 23.11.2017.
//  Copyright © 2017 Александр Чернов. All rights reserved.
//

import UIKit
import SDWebImage


class CollectionVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var imageSize: CGSize {
        get {
            let size = (collectionView.bounds.size.width - 2) / 3
            return CGSize(width: size, height: size)
        }
    }
    var presenterInput: PresenterInput?
    var presenterOutput: PresenterOutput?
    let kCounterCellNIB = UINib(nibName: "CustomViewCell", bundle: nil)
    let kCounterCellReuseIdentifer = "kCounterCellReuseIdentifer"
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(kCounterCellNIB, forCellWithReuseIdentifier: kCounterCellReuseIdentifer)
        DependencyInjector.assignPresenter(view: self)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenterOutput != nil ? presenterOutput!.numberOfEntities() : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        if let model = presenterOutput?.entityAt(indexPath: indexPath) as? Post {
        cell.configureSelf(dataModel: model)
    }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return imageSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0,0,0,0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       ImageListPresenter.userIndex = indexPath.row
        performSegue(withIdentifier: "gridSeque", sender: self)
    }
}

extension CollectionVC: ViewInput
{
    func reloadData() {
            collectionView.reloadData()
    }
    
    func assign(presenterInput: PresenterInput, presenterOutput: PresenterOutput) {
        self.presenterInput = presenterInput
        self.presenterOutput = presenterOutput
        presenterInput.viewLoaded(view: self)
    }
    
    
}
