//
//  GuessTheNumberViewController.swift
//  TestTask
//
//  Created by Павел Ткачев on 14.05.2022.
//

import UIKit

class GuessTheNumberViewController: UIViewController {
    
    @IBOutlet var guessTheNumberTextField: UITextField!
    @IBOutlet var enterTheNumberButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enterTheNumberButton.layer.cornerRadius = 10
    }
    
    var guessNumber = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let computerGuessingVC = segue.destination as? ComputerGuessingViewController else { return }
        computerGuessingVC.number = guessNumber
    }
    
    @IBAction func guessTheNumberPressed() {
        guessNumber = Int(guessTheNumberTextField.text ?? "") ?? 0
        if guessNumber <= 0 || guessNumber >= 101  {
            showAlert(title: "Error!", message: "Please, enter the number from 1 to 100")
        }
    }
}

// MARK: - Private Methods
extension GuessTheNumberViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in self.guessTheNumberTextField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension GuessTheNumberViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
