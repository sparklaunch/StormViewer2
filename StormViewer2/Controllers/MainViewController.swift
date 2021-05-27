//
//  ViewController.swift
//  StormViewer2
//
//  Created by Jinwook Kim on 2021/05/27.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var stormImageManager: StormImageManager = StormImageManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
    }
}

// MARK: - Initialization

extension MainViewController {
    func initialize() {
        self.title = "Storm Viewer 2"
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.stormImageManager.delegate = self
        self.tableView.register(UINib(nibName: "StormCell", bundle: nil), forCellReuseIdentifier: "StormCell")
    }
}

// MARK: - UITableViewDataSourceDelegate

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let stormCell: StormCell = self.tableView.dequeueReusableCell(withIdentifier: "StormCell", for: indexPath) as! StormCell
        return stormCell
    }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    
}

// MARK: - StormImageManagerDelegate

extension MainViewController: StormImageManagerDelegate {
    func didPopulateStormImages(_ stormImageManager: StormImageManager, with images: Data) {
        print(images)
    }
}
