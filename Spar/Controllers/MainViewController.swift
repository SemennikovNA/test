//
//  ViewController.swift
//  Spar
//
//  Created by Nikita on 31.01.2024.
//

import UIKit

final class MainViewController: UIViewController {

    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call method's
        setupView()
        setupConstraints()
    }

    //MARK: - Private methods
    /// Method for setup main view controller
    private func setupView() {
        view.backgroundColor = .yellow
    }
}

private extension MainViewController {
    
    func setupConstraints() {
        
    }
}

