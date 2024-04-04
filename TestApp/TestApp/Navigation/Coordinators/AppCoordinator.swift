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
        scenesSettings()
    }
    
    override func finish() {
        print("The AppCordinator has been finished")
    }
    
    private func scenesSettings() {
        showMain()
        //TODO: - user defaults
    }
    
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(
        _ childCoordinator: CoordinatorProtocol
    ) {
        removeChildCoordinator(childCoordinator)
        switch childCoordinator.type {
        case .main:
            navigationController?.viewControllers.removeAll()
            showAdvertisement()
        case .advertisement:
            navigationController?.viewControllers.removeAll()
            showHome()
        case .app: return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}

//MARK: - Navigation methods
private extension AppCoordinator {
    func showMain() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordinator = MainCoordinator(
            type: .main,
            navigationController: navigationController,
            finishDelegate: self)
        addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    func showAdvertisement() {
        guard let navigationController = navigationController else { return }
        let advertisementCoordinator = AdvertisementCoordinator(
            type: .advertisement,
            navigationController: navigationController,
            finishDelegate: self)
        addChildCoordinator(advertisementCoordinator)
        advertisementCoordinator.start()
    }
    
    func showHome() {
        guard let navigationController = navigationController else { return }
        let homeCoordinator = HomeCoordinator(
            type: .home,
            navigationController: navigationController,
            finishDelegate: self)
        addChildCoordinator(homeCoordinator)
        homeCoordinator.start()
    }
}


