//
//  ViewController.swift
//  MyFlickr
//
//  Created by Александр Чернов on 20.11.2017.
//  Copyright © 2017 Александр Чернов. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    var dataSource = NSArray()
    @IBOutlet weak var tableView: UITableView!
    let kCounterCellNIB = UINib(nibName: "CustomViewCell", bundle: nil)
    let kCounterCellReuseIdentifer = "kCounterCellReuseIdentifer"
    
    var presenterInput: PresenterInput?
    var presenterOutput: PresenterOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         print("запущено")
        tableView.register(kCounterCellNIB, forCellReuseIdentifier: kCounterCellReuseIdentifer)
        DependencyInjector.assignPresenter(view: self)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: ViewInput
{
    func reloadData() {
        tableView.reloadData()
    }
    
    func assign(presenterInput: PresenterInput, presenterOutput: PresenterOutput) {
        self.presenterInput = presenterInput
        self.presenterOutput = presenterOutput
        presenterInput.viewLoaded(view: self)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenterOutput != nil ? presenterOutput!.numberOfEntities() : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCounterCellReuseIdentifer, for: indexPath) as! CustomViewCell
        if let model = presenterOutput!.entityAt(indexPath: indexPath) as? Post
        {
            cell.viewModel = model
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ImageListPresenter.userIndex = indexPath.row
        performSegue(withIdentifier: "tableSeque", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = presenterOutput!.entityAt(indexPath: indexPath) as? Post
        if model?.downloadedSize != nil {
            return model!.downloadedSize!.height
        } else {
            presenterInput?.photoSize(model: model!, indexPath: indexPath, tableView: self.tableView, view: self.view)
            return 300
        }
    }
}



