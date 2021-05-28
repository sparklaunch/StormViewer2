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
    func populateStormImages() {
        let fileManager: FileManager = FileManager()
        let path: String = Bundle.main.resourcePath!
        let resourceList: [String] = try! fileManager.contentsOfDirectory(atPath: path)
        let data: [String] = resourceList.filter { (string: String) in
            return string.hasPrefix(K.nsslPrefix)
        }
        let sortedData: [String] = self.sortStormImages(with: data)
        self.delegate?.didPopulateStormImages(self, with: sortedData)
    }
    func sortStormImages(with images: [String]) -> [String] {
        let sortedImages: [String] = images.sorted { firstString, secondString in
            let firstIndex: String.Index = firstString.index(firstString.startIndex, offsetBy: 6)
            let secondIndex: String.Index = secondString.index(secondString.endIndex, offsetBy: -5)
            let range: ClosedRange<String.Index> = firstIndex...secondIndex
            let firstNumber: String = String(firstString[range])
            let secondNumber: String = String(secondString[range])
            return Int(firstNumber)! < Int(secondNumber)!
        }
        return sortedImages
    }
}
