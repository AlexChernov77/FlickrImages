//
//  InformationVCViewController.swift
//  MyFlickr
//
//  Created by Александр Чернов on 23.11.2017.
//  Copyright © 2017 Александр Чернов. All rights reserved.
//

import UIKit
import MWPhotoBrowser

class InformationVCViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var photoArrayForBrowser = NSMutableArray()


    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    
    @IBAction func buttonSelectedToBrowser(_ sender: UIButton) {
        let browser = MWPhotoBrowser()
        browser.delegate = self
        browser.displayNavArrows = true
        browser.alwaysShowControls = true
        browser.enableGrid = true
        browser.setCurrentPhotoIndex(UInt(bitPattern: ImageListPresenter.userIndex!))
        
        
        navigationController?.pushViewController(browser, animated: true)
    }
    func loadData () {
        let object = ImageListPresenter.dataSource[ImageListPresenter.userIndex!]
            let urlPic = (object as! Post).photoURL
            imageView.sd_setImage(with: URL(string: urlPic))
            textLabel.text = (object as! Post).authorName
            if (object as! Post).authorName.count < 50 {
                textLabel.text = (object as! Post).authorName
            } else {
                textLabel.text = "Beauty image"
            }
        fillPhotoArray()
    }
}



//MARK: - MWPhotoBrowser
extension InformationVCViewController: MWPhotoBrowserDelegate {
    
    private func fillPhotoArray () {
        for data in ImageListPresenter.photoUrl {
            let photoUrl = data as! String
            photoArrayForBrowser.add(MWPhoto(url: URL(string: photoUrl)))
        }
    }
    
    func numberOfPhotos(in photoBrowser: MWPhotoBrowser!) -> UInt {
        return UInt(bitPattern: photoArrayForBrowser.count)
    }
    
    func photoBrowser(_ photoBrowser: MWPhotoBrowser!, photoAt index: UInt) -> MWPhotoProtocol! {
        let kk = photoArrayForBrowser.object(at: Int(index)) as! MWPhoto
        return kk
    }
    
    func photoBrowser(_ photoBrowser: MWPhotoBrowser!, thumbPhotoAt index: UInt) -> MWPhotoProtocol! {
        let kk = photoArrayForBrowser.object(at: Int(index)) as! MWPhoto
        return kk
    }
}
