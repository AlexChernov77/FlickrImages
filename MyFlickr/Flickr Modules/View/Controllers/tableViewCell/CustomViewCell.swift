//
//  CustomViewCell.swift
//  MyFlickr
//
//  Created by Александр Чернов on 20.11.2017.
//  Copyright © 2017 Александр Чернов. All rights reserved.
//

import UIKit

class CustomViewCell: UITableViewCell {

   
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var viewModel : Post? {
        
        didSet {
            photoImageView.sd_setImage(with: URL(string : viewModel!.photoURL))
        }
    }
}

