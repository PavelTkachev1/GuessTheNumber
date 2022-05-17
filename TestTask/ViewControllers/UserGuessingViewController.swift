//
//  UserGuessingViewController.swift
//  TestTask
//
//  Created by Павел Ткачев on 15.05.2022.
//

import UIKit

class UserGuessingViewController: UIViewController {
    
    @IBOutlet var attemptLabel: UILabel!
    @IBOutlet var enterTheNumberTextField: UITextField!
    @IBOutlet var computerAnswerLabel: UILabel!
    @IBOutlet var guessButton: UIButton!
    
    var computerGuess: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessButton.layer.cornerRadius = 10
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultViewController else { return }
        resultVC.userCount = attempt
        resultVC.computerCount = computerGuess
    }
    
    let computerNumber = Int.random(in: 1...100)
    var attempt = 1
    
    @IBAction func guessButtonPressed() {
        let userNumber = Int(enterTheNumberTextField.text ?? "") ?? 0
        if userNumber <= 0 || userNumber >= 101  {
            showAlert(title: "Error!", message: "Please, enter the number from 1 to 100")
        } else {
            if userNumber > computerNumber {
                computerAnswerLabel.text = "No, my number is less than yours"
            } else if userNumber < computerNumber {
                computerAnswerLabel.text = "No, my number is more than yours"
            } else {
                performSegue(withIdentifier: "showScores", sender: nil)
            }
            attempt += 1
            attemptLabel.text = "Try № \(attempt)"
        }
        enterTheNumberTextField?.text = ""
    }
}

// MARK: - Private Methods
extension UserGuessingViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in self.enterTheNumberTextField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
// MARK: - UITextFieldDelegate
extension UserGuessingViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
}
