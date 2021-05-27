//
//  ViewController.swift
//  StormViewer2
//
//  Created by Jinwook Kim on 2021/05/27.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var stormImages: [String] = [String]()
    var stormImageManager: StormImageManager = StormImageManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
    }
}

// MARK: - Initialization

extension MainViewController {
    func initialize() {
        self.title = K.title
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.stormImageManager.delegate = self
        self.tableView.register(UINib(nibName: K.cellIdentifier, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        self.stormImageManager.populateStormImages()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - UITableViewDataSourceDelegate

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stormImages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let stormCell: StormCell = self.tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! StormCell
        let label: String = self.stormImages[indexPath.row]
        stormCell.stormCellLabel.text = label
        return stormCell
    }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
}

// MARK: - StormImageManagerDelegate

extension MainViewController: StormImageManagerDelegate {
    func didPopulateStormImages(_ stormImageManager: StormImageManager, with images: [String]) {
        self.stormImages = images
    }
}
