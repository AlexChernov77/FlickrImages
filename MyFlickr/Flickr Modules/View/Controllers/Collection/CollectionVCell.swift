//
//  CollectionVCell.swift
//  MyFlickr
//
//  Created by Александр Чернов on 29.11.2017.
//  Copyright © 2017 Александр Чернов. All rights reserved.
//

import UIKit

class CollectionVCell: UICollectionViewCell {

    @IBOutlet weak var collectionImageView: UIImageView!

    func configureSelf ( dataModel : Post )
    {
        let url = URL(string: dataModel.photoURL )
        
        collectionImageView.sd_setImage(with: url)
    }
}
