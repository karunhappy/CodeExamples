//
//  CellView+Extension.swift
//  KHProjects
//
//  Created by Karun Aggarwal on 27/06/23.
//

import UIKit

extension UICollectionView {
    /// Register CollectionView Cell
    /// - Parameter cellClass: Cell Class
    func registerCell(with cellClassName: String) {
        let nib = UINib(nibName: cellClassName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: cellClassName)
    }
}

extension UITableView {
    /// Register TableView Cell
    /// - Parameter cellClass: Cell Class
    func registerCell(with cellClassName: String) {
        let nib = UINib(nibName: cellClassName, bundle: nil)
        register(nib, forCellReuseIdentifier: cellClassName)
    }
}
