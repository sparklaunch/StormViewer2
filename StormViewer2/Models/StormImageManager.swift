//
//  StormImageManager.swift
//  StormViewer2
//
//  Created by Jinwook Kim on 2021/05/27.
//

import Foundation

protocol StormImageManagerDelegate {
    func didPopulateStormImages(_ stormImageManager: StormImageManager, with images: [String])
}

struct StormImageManager {
    var delegate: StormImageManagerDelegate?
    var stormImages: [StormImage] = [StormImage]()
    func populateStormImages() {
        let fileManager: FileManager = FileManager()
        let path: String = Bundle.main.resourcePath!
        let resourceList: [String] = try! fileManager.contentsOfDirectory(atPath: path)
        let data: [String] = resourceList.filter { (string: String) in
            return string.hasPrefix("nssl")
        }
        self.delegate?.didPopulateStormImages(self, with: data)
    }
}
