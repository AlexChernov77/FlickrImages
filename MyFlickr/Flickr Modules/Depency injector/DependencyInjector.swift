//
//  DependencyInjector.swift
//  MyFlickr
//
//  Created by Александр Чернов on 05.01.2018.
//  Copyright © 2018 Александр Чернов. All rights reserved.
//

import Foundation

class  DependencyInjector
{
    class func assignPresenter ( view : ViewInput) {
        if (view is ViewController) || (view is CollectionVC) || (view is InformationVCViewController) {
            let presenter = ImageListPresenter()
            view.assign(presenterInput: presenter, presenterOutput: presenter)
        }
    }
}
