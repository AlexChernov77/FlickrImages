//
//  Post.swift
//  MyFlickr
//
//  Created by Александр Чернов on 20.11.2017.
//  Copyright © 2017 Александр Чернов. All rights reserved.
//

import UIKit

class Post {
    var id: String
    var photoURL: String
    var authorName: String
    var downloadedSize : CGSize?
    
    init (id: String, photoURL: String, authorName: String) {
        self.authorName = authorName
        self.id = id
        self.photoURL = photoURL
    }
}
