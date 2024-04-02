//
//  MainViewPresenter.swift
//  TestApp
//
//  Created by Kirill Severin on 3.04.24.
//

import Foundation

protocol MainViewOutput: AnyObject {
    func mainFinish()
}

class MainViewPresenter: MainViewOutput {
    
    weak var coordinator: MainCoordinator!
    
    init(
        coordinator: MainCoordinator!
    ) {
        self.coordinator = coordinator
    }
    
    func mainFinish() {
        coordinator.finish()
    }
    
}
