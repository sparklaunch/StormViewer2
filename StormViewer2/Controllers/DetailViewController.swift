//
//  DetailViewController.swift
//  StormViewer2
//
//  Created by Jinwook Kim on 2021/05/27.
//

import UIKit

class DetailViewController: UIViewController {
    var image: UIImage?
    @IBOutlet var detailImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailImageView.image = self.image!
    }
}
