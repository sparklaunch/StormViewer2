//
//  StormImageManager.swift
//  StormViewer2
//
//  Created by Jinwook Kim on 2021/05/27.
//

import Foundation

protocol StormImageManagerDelegate {
    func didPopulateStormImages(_ stormImageManager: StormImageManager, with images: Data)
}

struct StormImageManager {
    var delegate: StormImageManagerDelegate?
    var stormImages: [StormImage] = [StormImage]()
    func populateStormImages() {
        let fileManager: FileManager = FileManager()
        let path: String = Bundle.main.resourcePath!
        let data: Data = fileManager.contents(atPath: path)!
        self.delegate?.didPopulateStormImages(self, with: data)
    }
}
