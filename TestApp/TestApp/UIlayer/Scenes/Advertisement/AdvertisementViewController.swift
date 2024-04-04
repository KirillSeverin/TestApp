//
//  AdvertisementViewController.swift
//  TestApp
//
//  Created by Kirill Severin on 3.04.24.
//

import UIKit


//TODO: Rename colors
class AdvertisementViewController: UIViewController {
    
    //MARK: - Properties
    private let topBackgroundView = UIView() //TODO: Collection view
    private let bottomBackgroundView = UILabel()
    private let specialOfferView = UILabel()
    private let lifeTimeSubscriptionView = TASubscriptionView()
    private let monthlyPlanSubscriptionView = TASubscriptionView()
    private let subscriptionStackView = UIStackView()
    private let continueButton = UIButton()
    private let noADSImage = UIImageView()
    private let termsOfUseButton = UIButton()
    private let privacyPolicyButton = UIButton()
    private let restorePurchaseButton = UIButton()
    private let documentsStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

//MARK: - Layout
private extension AdvertisementViewController {
    func setupLayout() {
        setupTopBackgroundView()
        setupBottomBackgroundView()
        setupSpecialOfferLabel()
        setupLifeTimeSubscriptionView()
        setupMonthlyPlanSubscriptionView()
        setupSubscriptionStackView()
        setupButton()
        setupNoADS()
        setupTermsOfUseButton()
        setupPrivacyPolicyButton()
        setupRestorePurchaseButton()
        setupDocumentsStackView()
    }
    
    func setupTopBackgroundView() {
        view.addSubview(topBackgroundView)
        topBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        topBackgroundView.backgroundColor = TAColors.subscriptionGray
        
        NSLayoutConstraint.activate([
            topBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            topBackgroundView.widthAnchor.constraint(equalToConstant: view.frame.width),
            topBackgroundView.heightAnchor.constraint(equalToConstant: view.frame.height/2)
        ])
    }
    
    func setupBottomBackgroundView() {
        view.addSubview(bottomBackgroundView)
        bottomBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        bottomBackgroundView.backgroundColor = TAColors.subscriptionViewBackground
        
        NSLayoutConstraint.activate([
            bottomBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomBackgroundView.widthAnchor.constraint(equalToConstant: view.frame.width),
            bottomBackgroundView.heightAnchor.constraint(equalToConstant: view.frame.height/2)
        ])
    }
    
    func setupSpecialOfferLabel() {
        view.addSubview(specialOfferView)
        specialOfferView.translatesAutoresizingMaskIntoConstraints = false
        let attributedString = NSMutableAttributedString(string: "SPECIAL OFFER\n", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 29, weight: .heavy),
            NSAttributedString.Key.foregroundColor: TAColors.white
        ])
        let smallerText = NSAttributedString(string: "50% OFF", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 60, weight: .black),
            NSAttributedString.Key.foregroundColor: TAColors.white
        ])

        attributedString.append(smallerText)
        specialOfferView.attributedText = attributedString
        specialOfferView.numberOfLines = 0
        specialOfferView.textAlignment = .center
        
        NSLayoutConstraint.activate([
            specialOfferView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            specialOfferView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            specialOfferView.widthAnchor.constraint(equalToConstant: 269)
        ])
    }
    
    func setupLifeTimeSubscriptionView() {
        lifeTimeSubscriptionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lifeTimeSubscriptionView.widthAnchor.constraint(equalToConstant: 108),
            lifeTimeSubscriptionView.heightAnchor.constraint(equalToConstant: 122)
        ])
    }
    
    func setupMonthlyPlanSubscriptionView() {
        monthlyPlanSubscriptionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            monthlyPlanSubscriptionView.widthAnchor.constraint(equalToConstant: 108),
            monthlyPlanSubscriptionView.heightAnchor.constraint(equalToConstant: 122)
        ])
    }
    
    func setupSubscriptionStackView() {
        view.addSubview(subscriptionStackView)
        subscriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        subscriptionStackView.axis = .horizontal
        subscriptionStackView.spacing = 25
        subscriptionStackView.addArrangedSubview(lifeTimeSubscriptionView)
        subscriptionStackView.addArrangedSubview(monthlyPlanSubscriptionView)
        
        NSLayoutConstraint.activate([
            subscriptionStackView.topAnchor.constraint(equalTo: specialOfferView.bottomAnchor, constant: 60),
            subscriptionStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupButton() {
        view.addSubview(continueButton)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.setTitle("CONTINUE", for: .normal)
        continueButton.setTitleColor(TAColors.white, for: .normal)
        continueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        continueButton.titleLabel?.textAlignment = .center
        continueButton.layer.cornerRadius = 10
        continueButton.backgroundColor = TAColors.green
        
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: subscriptionStackView.bottomAnchor, constant: 25),
            continueButton.leadingAnchor.constraint(equalTo: bottomBackgroundView.leadingAnchor, constant: 34),
            continueButton.trailingAnchor.constraint(equalTo: bottomBackgroundView.trailingAnchor, constant: -34),
            continueButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setupNoADS() {
        continueButton.addSubview(noADSImage)
        noADSImage.translatesAutoresizingMaskIntoConstraints = false
        noADSImage.image = UIImage(resource: .noAds)
        
        NSLayoutConstraint.activate([
            noADSImage.topAnchor.constraint(equalTo: continueButton.topAnchor, constant: -18),
            noADSImage.trailingAnchor.constraint(equalTo: continueButton.trailingAnchor, constant: 12)
        ])
    }
    
    func setupTermsOfUseButton() {
        termsOfUseButton.translatesAutoresizingMaskIntoConstraints = false
        termsOfUseButton.setTitle("Terms of use", for: .normal)
        termsOfUseButton.setTitleColor(TAColors.subscriptionGray, for: .normal)
        termsOfUseButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        termsOfUseButton.titleLabel?.textAlignment = .center
    }
    
    func setupPrivacyPolicyButton() {
        privacyPolicyButton.translatesAutoresizingMaskIntoConstraints = false
        privacyPolicyButton.setTitle("Privacy policy", for: .normal)
        privacyPolicyButton.setTitleColor(TAColors.subscriptionGray, for: .normal)
        privacyPolicyButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        privacyPolicyButton.titleLabel?.textAlignment = .center
    }
    
    func setupRestorePurchaseButton() {
        restorePurchaseButton.translatesAutoresizingMaskIntoConstraints = false
        restorePurchaseButton.setTitle("Restore purchase", for: .normal)
        restorePurchaseButton.setTitleColor(TAColors.subscriptionGray, for: .normal)
        restorePurchaseButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        restorePurchaseButton.titleLabel?.textAlignment = .center
    }
    
    func setupDocumentsStackView() {
        view.addSubview(documentsStackView)
        documentsStackView.translatesAutoresizingMaskIntoConstraints = false
        documentsStackView.axis = .horizontal
        documentsStackView.spacing = 5
        documentsStackView.distribution = .equalSpacing
        documentsStackView.addArrangedSubview(termsOfUseButton)
        documentsStackView.addArrangedSubview(privacyPolicyButton)
        documentsStackView.addArrangedSubview(restorePurchaseButton)
        
        NSLayoutConstraint.activate([
            documentsStackView.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 20),
            documentsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            documentsStackView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}

#Preview("AdvertisementViewController") {
    AdvertisementViewController()
}
