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

protocol Storyboarded {
    static func instantiateFrom(storyboard: String) -> UIViewController
}

extension UIViewController: Storyboarded {
    static func instantiateFrom(storyboard: String) -> UIViewController {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let sb = UIStoryboard(name: storyboard, bundle: Bundle.main)
        return sb.instantiateViewController(withIdentifier: className)
    }
}
