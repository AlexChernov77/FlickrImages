//
//  ViewInput.swift
//  MyFlickr
//
//  Created by Александр Чернов on 05.01.2018.
//  Copyright © 2018 Александр Чернов. All rights reserved.
//

import Foundation

protocol ViewInput: class
{
    func reloadData()
    func assign (presenterInput: PresenterInput, presenterOutput: PresenterOutput)
}
