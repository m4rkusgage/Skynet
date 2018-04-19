//
//  Storyboard.swift
//  Skynet
//
//  Created by Markus Gage on 2018-04-19.
//  Copyright © 2018 Mark Gage. All rights reserved.
//

import UIKit

enum StoryboardName: String {
    case main = "Main"
}

protocol Storyboard {
    static func instantiate(storyboardName: String) -> Self
}

extension Storyboard where Self: UIViewController {
    static func instantiate(storyboardName: String) -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
