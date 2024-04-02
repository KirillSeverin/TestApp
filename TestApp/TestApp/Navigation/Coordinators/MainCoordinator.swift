//
//  MainCoordinator.swift
//  TestApp
//
//  Created by Kirill Severin on 2.04.24.
//

import Foundation


class MainCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("The AppCordinator has been finished")
    }
    
}
