//
//  HomeViewController.swift
//  TestApp
//
//  Created by Kirill Severin on 3.04.24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let textLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
    }

    private func setupLabel() {
        view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = "Hello, World!"
        textLabel.textColor = TAColors.green
        textLabel.font = UIFont.systemFont(ofSize: 40, weight: .black)
        textLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
