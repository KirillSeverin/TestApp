//
//  MainViewController.swift
//  TestApp
//
//  Created by Kirill Severin on 2.04.24.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Properties
    let backgroundView = UIView()
    var viewOutput: MainViewOutput!
    
    //MARK: - Initializers
    init(
        viewOutput: MainViewOutput!
    ) {
        self.viewOutput = viewOutput
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        setupButtonView()
    }
    
}

//MARK: - Layout
extension MainViewController {
    @objc private func buttonViewPressing() {
        print("Pressed")
        viewOutput.mainFinish()
    }
    
    private func setupButtonView() {
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(buttonViewPressing))
        backgroundView.addGestureRecognizer(tap)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
