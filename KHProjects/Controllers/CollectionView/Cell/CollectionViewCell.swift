//
//  CollectionViewCell.swift
//  KHProjects
//
//  Created by Karun Aggarwal on 06/06/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1
    }

    var setlabel: String? {
        didSet {
            label.text = setlabel
        }
    }
}
