//
//  ResultViewController.swift
//  TestTask
//
//  Created by Павел Ткачев on 15.05.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var userCountLabel: UILabel!
    @IBOutlet var computerCountLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var mainMenuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainMenuButton.layer.cornerRadius = 10
        
        let userCount = Int(userCountLabel.text ?? "") ?? 0
        let computerCount = Int(computerCountLabel.text ?? "") ?? 0
        
        if userCount > computerCount {
            resultLabel.text = "You win"
        } else {
            resultLabel.text = "You loss"
        }
    }
    
    
    
    
}
