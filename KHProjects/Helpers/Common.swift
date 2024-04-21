//
//  Common.swift
//  KHProjects
//
//  Created by Karun Aggarwal on 20/04/24.
//

import Foundation

enum Plists: String {
    case main = "MainList"
    case table = "TableList"
}

class Common {
    static func loadFromPlist(from list: Plists) -> [String] {
        if let path = Bundle.main.path(forResource: list.rawValue, ofType: "plist") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                do {
                    let plistData = try PropertyListSerialization.propertyList(from: data, format: nil)
                    return plistData as! [String]
                } catch {
                    print("Error loading plist: ", error.localizedDescription)
                }
            }
        }
        return []
    }
}
