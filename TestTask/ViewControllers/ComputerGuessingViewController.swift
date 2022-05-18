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
    var minimumNumber: Float = 0
    var maximumNumber: Float = 100
    var middleNumber: Float {
        round((minimumNumber + maximumNumber) / 2)
    }
    
    @IBAction func moreButtonPressed() {
        if Int(middleNumber) > number || Int(middleNumber) == number  {
            showAlert(title: "Error!", message: "Don't cheat.")
        } else {
            minimumNumber = middleNumber
            guessLabel.text = "Your number is - \(Int(middleNumber))?"
            attempt += 1
            tryLabel.text = " Try № \(attempt)"
        }
        
    }
    
    @IBAction func equallyButtonPressed() {
        if Int(middleNumber) != number {
            showAlert(title: "Error!", message: "The computer didn't guess your number.")
        }
    }
    
    @IBAction func lessButtonPressed() {
        if Int(middleNumber) < number || Int(middleNumber) == number {
            showAlert(title: "Error!", message: "Don't cheat.")
        } else {
            maximumNumber = middleNumber
            guessLabel.text = "Your number is - \(Int(middleNumber))?"
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

