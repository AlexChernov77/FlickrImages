//
//  PresenterInput.swift
//  MyFlickr
//
//  Created by Александр Чернов on 05.01.2018.
//  Copyright © 2018 Александр Чернов. All rights reserved.
//

import UIKit

protocol PresenterInput: class
{
    func viewLoaded ( view: ViewInput)
    func photoSize ( model : Post , indexPath : IndexPath, tableView: UITableView, view: UIView )
}
