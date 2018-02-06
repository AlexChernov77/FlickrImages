//
//  DataLayer.swift
//  MyFlickr
//
//  Created by Александр Чернов on 02.01.2018.
//  Copyright © 2018 Александр Чернов. All rights reserved.
//

import UIKit

class DataLayer {
    
    static let shared = DataLayer()
    func getData ( completion: @escaping (NSArray, NSArray) -> Void) {
        API_WRAPPER.getRawData { response in
            let photosObject = response["photos"]
            let photosArray = photosObject["photo"].arrayValue
            let outArray = NSMutableArray()
            let photoOutArray = NSMutableArray()
            
            for i in 0..<photosArray.count {
                let photo = photosArray[i]
                
                let id = photo["id"].stringValue
                let farmId = photo["farm"].int64Value
                let serverId = photo["server"].int64Value
                let secret = photo["secret"].stringValue
                let photoURL = "https://farm\(farmId).staticflickr.com/\(serverId)/\(id)_\(secret).jpg"
                let title = photo["title"].stringValue
                
                let post = Post(id: id, photoURL: photoURL, authorName: title)
                outArray.add(post)
                photoOutArray.add(photoURL)
                print ("\(i) - \(photo)")
            }
            
            DispatchQueue.main.async {

                completion(outArray, photoOutArray)
            }
        }
    }
}

