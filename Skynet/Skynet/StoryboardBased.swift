//
//  StoryboardBased.swift
//  Skynet
//
//  Created by Markus Gage on 2018-04-24.
//  Copyright © 2018 Mark Gage. All rights reserved.
//

import UIKit

enum Storyboard: String {
    case main = "Main"
    case tutorial = "Tutorial"
    
    var name: String {
        return rawValue
    }
}

protocol StoryboardBased: class {
    static var storyboardIdentifier: String { get }
}

extension StoryboardBased where Self: UIViewController {

    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static func instantiate(storyboard: Storyboard = Storyboard.main) -> Self {
        let storyboard = UIStoryboard(name: storyboard.name, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: Self.storyboardIdentifier) as? Self else {
            fatalError("Could not instantiate initial storyboard with name: \(Self.storyboardIdentifier)")
        }
        return viewController
    }
}
