//
//  AdvertisementPresenter.swift
//  TestApp
//
//  Created by Kirill Severin on 3.04.24.
//

import Foundation


protocol AdvertisementViewOutput: AnyObject {
    func advertisementFinish()
}

class AdvertisementPresenter: AdvertisementViewOutput {
    
    weak var coordinator: AdvertisementCoordinator!
    
    init(
        coordinator: AdvertisementCoordinator? = nil
    ) {
        self.coordinator = coordinator
    }
    
    func advertisementFinish() {
        coordinator.finish()
    }
    
}
