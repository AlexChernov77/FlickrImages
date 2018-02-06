//
//  PresenterOutPut.swift
//  MyFlickr
//
//  Created by Александр Чернов on 05.01.2018.
//  Copyright © 2018 Александр Чернов. All rights reserved.
//

import Foundation

protocol PresenterOutput: class
{

    func numberOfEntities() -> Int
    func entityAt ( indexPath : IndexPath ) -> Any?
    func photoNumber (index: Int ) -> Any?
}
