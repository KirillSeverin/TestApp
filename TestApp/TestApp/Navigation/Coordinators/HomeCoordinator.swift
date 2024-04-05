//
//  HomeCoordinator.swift
//  TestApp
//
//  Created by Kirill Severin on 3.04.24.
//

import Foundation

class HomeCoordinator: Coordinator {
    
    override func start() {
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("The AppCordinator has been finished")
        finishDelegate?.coordinatorDidFinish(self)
    }
    
}
