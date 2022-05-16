//
//  ComputerGuessingViewController.swift
//  TestTask
//
//  Created by Павел Ткачев on 15.05.2022.
//

import UIKit

class ComputerGuessingViewController: UIViewController {
    
    @IBOutlet var tryLabel: UILabel!
    @IBOutlet var guessLabel: UILabel!
    @IBOutlet var moreButton: UIButton!
    @IBOutlet var equallyButton: UIButton!
    @IBOutlet var lessButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moreButton.layer.borderWidth = 1
        moreButton.layer.cornerRadius = 10
        equallyButton.layer.borderWidth = 1
        equallyButton.layer.cornerRadius = 10
        lessButton.layer.borderWidth = 1
        lessButton.layer.cornerRadius = 10
    }
    
    @IBAction func moreButtonPressed() {
    }
    @IBAction func equallyButtonPressed() {
    }
    @IBAction func lessButtonPressed() {
    }
    
    
    
}
// MARK: - Private Methods
extension ComputerGuessingViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

