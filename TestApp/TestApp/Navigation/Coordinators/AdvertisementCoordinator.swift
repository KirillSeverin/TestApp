//
//  AdvertisementCoordinator.swift
//  TestApp
//
//  Created by Kirill Severin on 3.04.24.
//

import UIKit

class AdvertisementCoordinator: Coordinator {
    
    override func start() {
        showAdvertisementScene()
    }
    
    override func finish() {
        print("The AdvertisementCoordinator has been finished")
        finishDelegate?.coordinatorDidFinish(self)
    }
    
}

extension AdvertisementCoordinator {
    func showAdvertisementScene() {
        let presenter = AdvertisementPresenter(coordinator: self)
        let vc = AdvertisementViewController(viewOutput: presenter)
        navigationController?.pushViewController(vc, animated: true)
    }
}
