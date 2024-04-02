//
//  AppCoordinator.swift
//  TestApp
//
//  Created by Kirill Severin on 2.04.24.
//

import Foundation

import UIKit

class AppCoordinator: Coordinator {
    override func start() {
        showMainFlow()
    }
    
    override func finish() {
        print("The AppCordinator has been finished")
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(_ childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        switch childCoordinator.type {
        case .app: return
        default: navigationController?.popToRootViewController(animated: false)
        }
    }
}

//MARK: - Navigation methods
private extension AppCoordinator {
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordinator = MainCoordinator(type: .main, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
}


