//
//  String+Extension.swift
//  KHProjects
//
//  Created by Karun Aggarwal on 27/06/23.
//

import Foundation

extension NSObject {
    static var toString: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
