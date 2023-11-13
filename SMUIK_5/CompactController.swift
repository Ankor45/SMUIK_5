//
//  CompactController.swift
//  SMUIK_5
//
//  Created by Andrei Kovryzhenko on 14.11.2023.
//

import UIKit

class CompactController: UIViewController {
    
    private lazy var segmentedControl = UISegmentedControl(items: ["280pt", "150pt"])
    private lazy var closeButton = UIButton(type: .close)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        setUpSegmentedControl()
        setUpCloseButton()
    }
    
    //MARK: SetUp segmentedControl and closeButton
    private func setUpSegmentedControl() {
        view.addSubview(segmentedControl)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(changeHeight), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setUpCloseButton() {
        view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(dismissPopUp), for: .touchUpInside)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.centerYAnchor.constraint(equalTo: segmentedControl.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
    //MARK: Methods
    @objc func dismissPopUp() {
        dismiss(animated: true)
    }
    
    @objc func changeHeight() {
        preferredContentSize.height = segmentedControl.selectedSegmentIndex == 1 ? 150 : 280
    }
}
