//
//  API_WRAPPER.swift
//  MyFlickr
//
//  Created by Александр Чернов on 02.01.2018.
//  Copyright © 2018 Александр Чернов. All rights reserved.
//

import UIKit

class API_WRAPPER {
    
    // данные картинок
    class func getRawData ( complection: @escaping (JSON) -> Void ) {
        let urlString = "https://www.flickr.com/services/rest?method=flickr.interestingness.getList&api_key=3988023e15f45c8d4ef5590261b1dc53&per_page=20&page=1&format=json&nojsoncallback=1"
        /* oбъект класса URL - передаем строчку */
        let url = URL(string: urlString)!
        /* конструируем запрос в интернет - объект URLRequest */
        let request = URLRequest(url: url)
        /* отправляем запрос в интернет 1 стадия - получаем объект URLSessionDataTask */
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if data != nil {
                // let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                //print(responseString)
                let jsonResponse = JSON(data!)
                //print(jsonResponse)
                complection(jsonResponse)
            }
        }
        
        /* отправляем запрос в интернет 2 стадия - у объекта URLSessionDataTask вызываем процедуру resume */
        task.resume()
    }
    
    class func getSize ( model : Post , indexPath : IndexPath, tableView: UITableView, view: UIView )
    {
        let photoID = model.id
        let urlString = "https://www.flickr.com/services/rest?method=flickr.photos.getSizes&api_key=3988023e15f45c8d4ef5590261b1dc53&photo_id=\(photoID)&format=json&nojsoncallback=?"
        
        /*объект класса URL - передаём строчку*/
        let url = URL(string: urlString)!
        /*конструируем запрос в интеренет - объект URLRequest*/
        let request = URLRequest(url: url)
        /*отправляем запрос в интернет 1 стадия - получаем объект URLSessionDataTask*/
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            
            if data != nil
            {
                let jsonResponse = JSON(data!)
                print(jsonResponse)
                
                let sizesArray = jsonResponse["sizes"]["size"].arrayValue
                
                for size in sizesArray
                {
                    let label = size["label"].stringValue
                    
                    if label == "Large"
                    {
                        let width = CGFloat(size["width"].floatValue)
                        let hight = CGFloat(size["height"].floatValue)
                        
                        let screenWidth = view.frame.size.width
                        
                        let k = width/hight
                        
                        let trueHeight = screenWidth / k
                        
                        
                        let sizeStructure = CGSize(width: width, height: trueHeight)
                        let largeURL = size["source"].stringValue
                        
                        model.photoURL = largeURL
                        model.downloadedSize = sizeStructure

                        break
                    }
                }
            }
            
        })
        
        task.resume()
        
    }
}

