//
//  TableViewCell.swift
//  StormViewer2
//
//  Created by Jinwook Kim on 2021/05/27.
//

import UIKit

class StormCell: UITableViewCell {
    @IBOutlet var stormCellLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
