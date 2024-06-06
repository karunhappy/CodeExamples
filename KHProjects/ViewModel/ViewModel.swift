//
//  ViewModel.swift
//  KHProjects
//
//  Created by Karun Aggarwal on 06/06/24.
//

import Foundation

class ViewModel: NSObject {
    func fetchList() -> [String] {
        Common.loadFromPlist(from: .table)
    }
}
