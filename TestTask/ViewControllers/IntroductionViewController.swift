//
//  ViewController.swift
//  TestTask
//
//  Created by Павел Ткачев on 14.05.2022.
//

import UIKit

class IntroductionViewController: UIViewController {
    
    @IBOutlet var startNewGameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGameButton.layer.cornerRadius = 10
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {}
}

