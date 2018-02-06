//
//  CollectionViewCell.swift
//  MyFlickr
//
//  Created by Александр Чернов on 23.11.2017.
//  Copyright © 2017 Александр Чернов. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var collectionLabel: UILabel!
    
    func configureSelf ( dataModel : Post )
    {
       imageViewCell.layer.borderWidth = 2
        let url = URL(string: dataModel.photoURL )
        imageViewCell.sd_setImage(with: url)
    }
}
