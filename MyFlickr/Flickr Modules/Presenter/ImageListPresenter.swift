//
//  ImageListPresenter.swift
//  MyFlickr
//
//  Created by Александр Чернов on 05.01.2018.
//  Copyright © 2018 Александр Чернов. All rights reserved.
//

import UIKit

class ImageListPresenter
{
    
    weak var viewInput: ViewInput?
    static var dataSource = NSArray()
    static var photoUrl = NSArray()
    static var userIndex: Int?
    
    func getData ()
    {
        DataLayer.shared.getData { (array, urlPhotoArray) in
            DispatchQueue.main.async {
                print("Даннык получены")
                ImageListPresenter.dataSource = array
                ImageListPresenter.photoUrl = urlPhotoArray
                self.viewInput?.reloadData()
            }
        }
    }
}

extension ImageListPresenter: PresenterInput
{
    func photoSize(model: Post, indexPath: IndexPath, tableView: UITableView, view: UIView) {
        API_WRAPPER.getSize(model: model, indexPath: indexPath, tableView: tableView, view: view)
    }
    

    
    func viewLoaded(view: ViewInput) {
        self.viewInput = view
        getData()
    }
}

extension ImageListPresenter: PresenterOutput
{
    func photoNumber(index: Int) -> Any? {
        return ImageListPresenter.dataSource[index] as! Post
    }
    

    
    func numberOfEntities() -> Int {
        return ImageListPresenter.dataSource.count
    }
    
    func entityAt(indexPath: IndexPath) -> Any?
    {
        let index = indexPath.row
        if ImageListPresenter.dataSource.count - 1 < index
        {
            return nil
        }
        else
        {
            return ImageListPresenter.dataSource[index]
        }
    }
}


