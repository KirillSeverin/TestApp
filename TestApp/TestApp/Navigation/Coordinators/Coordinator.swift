//
//  Coordinator.swift
//  TestApp
//
//  Created by Kirill Severin on 2.04.24.
//

import UIKit

enum CoordinatorType {
    case app
    case main
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

class Coordinator: CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol]
    var type: CoordinatorType
    var navigationController: UINavigationController?
    var finishDelegate: CoordinatorFinishDelegate?
    
    init(
        childCoordinators: [CoordinatorProtocol] = [CoordinatorProtocol](),
        type: CoordinatorType,
        navigationController: UINavigationController?,
        finishDelegate: CoordinatorFinishDelegate? = nil
    ) {
        self.childCoordinators = childCoordinators
        self.type = type
        self.navigationController = navigationController
        self.finishDelegate = finishDelegate
    }
    
    deinit {
        print("The coordinator \(type) has been removed")
        childCoordinators.forEach { $0.finishDelegate = nil}
        childCoordinators.removeAll()
    }
    
    func start() {
        print("The coordinator \(type) has been started")
    }
    
    func finish() {
        print("The coordinator \(type) has been finished")
    }
}

