//
//  ViewController.swift
//  SMUIK_5
//
//  Created by Andrei Kovryzhenko on 13.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var showPopUpButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpShowPopUpButton()
    }
    
    //MARK: SetUp
    private func setUpShowPopUpButton() {
        view.addSubview(showPopUpButton)
        showPopUpButton.setTitle("Present", for: .normal)
        showPopUpButton.addTarget(self, action: #selector(showPopUpViewController), for: .touchUpInside)
        
        showPopUpButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showPopUpButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            showPopUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    //MARK: Open popUp
    @objc func showPopUpViewController(_ sender: UIButton) {
        let newVC = CompactController()
        newVC.modalPresentationStyle = .popover
        newVC.preferredContentSize = CGSize(width: 300, height: 280)
        newVC.popoverPresentationController?.sourceView = sender
        newVC.popoverPresentationController?.delegate = self
        present(newVC, animated: true)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
