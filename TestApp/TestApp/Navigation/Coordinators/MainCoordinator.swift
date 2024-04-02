//
//  MainCoordinator.swift
//  TestApp
//
//  Created by Kirill Severin on 2.04.24.
//

import Foundation


class MainCoordinator: Coordinator {
    
    override func start() {
        showMainScene()
    }
    
    override func finish() {
        print("The AppCordinator has been finished")
        finishDelegate?.coordinatorDidFinish(self)
    }
    
}

extension MainCoordinator {
    func showMainScene() {
        let presenter = MainViewPresenter(coordinator: self)
        let vc = MainViewController(viewOutput: presenter)
        navigationController?.pushViewController(vc, animated: true)
    }
}
