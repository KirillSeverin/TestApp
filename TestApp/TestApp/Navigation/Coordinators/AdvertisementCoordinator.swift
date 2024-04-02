//
//  AdvertisementCoordinator.swift
//  TestApp
//
//  Created by Kirill Severin on 3.04.24.
//

import UIKit

class AdvertisementCoordinator: Coordinator {
    
    override func start() {
        let vc = AdvertisementViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("The AppCordinator has been finished")
    }
    
}
