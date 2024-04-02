//
//  Coordinator.swift
//  TestApp
//
//  Created by Kirill Severin on 2.04.24.
//

import UIKit

enum CoordinatorType {
    case advertisement
    case home
}

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(_ cildCoordinator: CoordinatorProtocol)
}

protocol CoordinatorProtocol: AnyObject {
    var childCoordinators : [CoordinatorProtocol] { get set }
    var type: CoordinatorType { get }
    var navigationController: UINavigationController? { get set }
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    func start()
    func finish()
}

extension CoordinatorProtocol {
    func addChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators.append(childCoordinator)
    }
    func removeChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
    }
}

