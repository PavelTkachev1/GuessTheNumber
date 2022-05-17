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
    
    var number: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moreButton.layer.borderWidth = 1
        moreButton.layer.cornerRadius = 10
        equallyButton.layer.borderWidth = 1
        equallyButton.layer.cornerRadius = 10
        lessButton.layer.borderWidth = 1
        lessButton.layer.cornerRadius = 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userGuessingVC = segue.destination as? UserGuessingViewController else { return }
        userGuessingVC.computerGuess = attempt
    }
    
    var attempt = 1
    var min = 0
    var max = 100
    var middle: Int {
        (min + max) / 2
    }
    
    @IBAction func moreButtonPressed() {
        if middle > number {
            showAlert(title: "Don't cheat!", message: "Your number is less than \(middle)")
        } else {
            min = middle
            guessLabel.text = "Your number is - \(middle)?"
            attempt += 1
            tryLabel.text = " Try № \(attempt)"
        }
    }
    @IBAction func equallyButtonPressed() {
    }
    @IBAction func lessButtonPressed() {
        if middle < number {
            showAlert(title: "Don't cheat!", message: "Your number is more than \(middle)")
        } else {
            max = middle
            guessLabel.text = "Your number is - \(middle)?"
            attempt += 1
            tryLabel.text = " Try № \(attempt)"
        }
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

