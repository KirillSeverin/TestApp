//
//  AdvertisementViewController.swift
//  TestApp
//
//  Created by Kirill Severin on 3.04.24.
//

import UIKit

class AdvertisementViewController: UIViewController {
    
    private let bottomBackgroundView = UIView()
    private let specialOfferLabel = UILabel()
    private let lifeTimeSubscriptionView = TASubscriptionView()
    private let monthlyPlanSubscriptionView = TASubscriptionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
    }

    
}
