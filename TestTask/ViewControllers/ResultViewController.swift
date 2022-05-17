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
    
    var userCount: Int!
    var computerCount: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainMenuButton.layer.cornerRadius = 10
        userCountLabel.text = "Your's tries count: \(userCount ?? 0)"
        computerCountLabel.text = "Computer's tries count: \(computerCount ?? 0)"
        
        if userCount < computerCount {
            resultLabel.text = "You win"
        } else  if userCount > computerCount {
            resultLabel.text = "You loss"
        } else {
            resultLabel.text = "Draw"
        }
    }
}
