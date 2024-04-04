//
//  TASubscriptionPlanView.swift
//  TestApp
//
//  Created by Kirill Severin on 3.04.24.
//

import UIKit

enum SubscriptionState {
    case lifeTime
    case monthlyPlan
}

class TASubscriptionView: UIView {
    
    //MARK: - Properties
    private let popularBackgroundView = UIView()
    private let backgroundView = UIView()
    private let popularLabel = UILabel()
    private let circleView = UIView()
    private let subscriptionStateButton = UIButton()
    private let subscriptionName = UILabel()
    private let subscriptionOldPrice = UILabel()
    private let subscriptionNewPrice = UILabel()
    private let subscriptionPlan = UILabel()
    private let verticalStackView = UIStackView()
    private let priceStackView = UIStackView()
    
    var state: SubscriptionState = .lifeTime {
        didSet {
            setSubscriptionState(state)
        }
    }
    
    //MARK: - Initializers
    init(state: SubscriptionState = .lifeTime) {
        super.init(frame: .zero)
        self.state = state
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubscriptionState(_ state: SubscriptionState) {
        switch state {
        case .lifeTime:
            print()
        case .monthlyPlan:
            print()
        }
    }
    
    //MARK: - Layout
    private func setupLayout() {
        setupBackground()
        setupPopularBackroundView()
        setupPopularLabel()
        setupCircle()
        setupSubscriptionStateButton()
        setupPriceStackView()
        setupStackView()
        setupSubscriptionName()
        setupSubscriptionOldPrice()
        setupSubscriptionNewPrice()
        setupSubscriptionPlan()
    }
    
    private func setupBackground() {
        backgroundColor = TAColors.green
        layer.cornerRadius = 10
        
        addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = TAColors.subscriptionViewBackground
        backgroundView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 1),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1)
        ])
    }
    
    private func setupPopularBackroundView() {
        addSubview(popularBackgroundView)
        popularBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        popularBackgroundView.backgroundColor = TAColors.green
        popularBackgroundView.layer.cornerRadius = 6
        
        NSLayoutConstraint.activate([
            popularBackgroundView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -60),
            popularBackgroundView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            popularBackgroundView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            popularBackgroundView.heightAnchor.constraint(equalToConstant: 20),
            popularBackgroundView.widthAnchor.constraint(equalToConstant: 68)
        ])
    }
    
    private func setupPopularLabel() {
        addSubview(popularLabel)
        popularLabel.translatesAutoresizingMaskIntoConstraints = false
        popularLabel.text = "POPULAR"
        popularLabel.font = UIFont.boldSystemFont(ofSize: 12)
        popularLabel.textAlignment = .center
        popularLabel.textColor = TAColors.white
        
        NSLayoutConstraint.activate([
            popularLabel.centerYAnchor.constraint(equalTo: popularBackgroundView.centerYAnchor),
            popularLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            popularLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupCircle() {
        addSubview(circleView)
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.backgroundColor = TAColors.subscriptionViewBackground
        circleView.layer.cornerRadius = 10
        circleView.layer.borderColor = TAColors.green.cgColor
        circleView.layer.borderWidth = 1
        
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: popularBackgroundView.bottomAnchor, constant: 7),
            circleView.leftAnchor.constraint(equalTo: leftAnchor, constant: 44),
            circleView.widthAnchor.constraint(equalToConstant: 20),
            circleView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupSubscriptionStateButton() {
        addSubview(subscriptionStateButton)
        subscriptionStateButton.translatesAutoresizingMaskIntoConstraints = false
        subscriptionStateButton.backgroundColor = TAColors.green
        subscriptionStateButton.layer.cornerRadius = 7
        
        NSLayoutConstraint.activate([
            subscriptionStateButton.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            subscriptionStateButton.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            subscriptionStateButton.widthAnchor.constraint(equalToConstant: 14),
            subscriptionStateButton.heightAnchor.constraint(equalToConstant: 14)
        ])
    }
    
    private func setupPriceStackView() {
        addSubview(priceStackView)
        priceStackView.translatesAutoresizingMaskIntoConstraints = false
        priceStackView.axis = .horizontal
        priceStackView.addArrangedSubview(subscriptionOldPrice)
        priceStackView.addArrangedSubview(subscriptionNewPrice)
    }
    
    private func setupStackView() {
        addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 5
        verticalStackView.addArrangedSubview(subscriptionName)
        verticalStackView.addArrangedSubview(priceStackView)
        verticalStackView.addArrangedSubview(subscriptionPlan)
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 11),
            verticalStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 11),
            verticalStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -11),
        ])
    }
    
    private func setupSubscriptionName() {
        subscriptionName.translatesAutoresizingMaskIntoConstraints = false
        subscriptionName.text = "LIFETIME"
        subscriptionName.textColor = TAColors.white
        subscriptionName.textAlignment = .center
        subscriptionName.font = UIFont.boldSystemFont(ofSize: 12)
        
        NSLayoutConstraint.activate([
            subscriptionName.widthAnchor.constraint(equalToConstant: 86),
            subscriptionName.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
    
    private func setupSubscriptionOldPrice() {
        subscriptionOldPrice.translatesAutoresizingMaskIntoConstraints = false
        let attributedString = NSAttributedString(
            string: "$39.98",
            attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,
                         NSAttributedString.Key.foregroundColor: TAColors.subscriptionGray,
                         NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)
        ])
        subscriptionOldPrice.attributedText = attributedString
    }
    
    private func setupSubscriptionNewPrice() {
        subscriptionNewPrice.translatesAutoresizingMaskIntoConstraints = false
        subscriptionNewPrice.text = "$19.99"
        subscriptionNewPrice.textColor = TAColors.white
        subscriptionNewPrice.font = UIFont.systemFont(ofSize: 13)
    }
    
    private func setupSubscriptionPlan() {
        subscriptionPlan.translatesAutoresizingMaskIntoConstraints = false
        subscriptionPlan.text = "biled once"
        subscriptionPlan.textColor = TAColors.subscriptionGray
        subscriptionPlan.font = UIFont.systemFont(ofSize: 12)
        subscriptionPlan.textAlignment = .center
    }
    
}

#Preview("TASubscriptionView", traits: .fixedLayout(width: 108, height: 112)) {
    TASubscriptionView(state: .lifeTime)
}
