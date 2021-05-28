//
//  DetailViewController.swift
//  StormViewer2
//
//  Created by Jinwook Kim on 2021/05/27.
//

import UIKit

class DetailViewController: UIViewController {
    var image: UIImage?
    var index: Int?
    var totalCount: Int?
    @IBOutlet var detailImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailImageView.image = self.image!
        self.title = "Picture \(self.index!) of \(self.totalCount!)"
    }
}
