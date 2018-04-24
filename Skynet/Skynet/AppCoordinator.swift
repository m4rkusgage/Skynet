//
//  AppCoordinator.swift
//  Skynet
//
//  Created by Markus Gage on 2018-04-19.
//  Copyright © 2018 Mark Gage. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        let viewController = ViewController.instantiate()
        _ = ViewController.instantiate(storyboard: .main)
        _ = ViewController.instantiate(storyboard: .tutorial)
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
