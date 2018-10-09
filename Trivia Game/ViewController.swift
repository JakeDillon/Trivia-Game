//
//  ViewController.swift
//  Trivia Game
//
//  Created by Jake Dillon on 10/8/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var triviaLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   triviaLabel.text = "Welcome to the Trviva Game"
    resetButton.setTitle("reset", for: .normal)
    }

    @IBAction func resetButton(_ sender: Any) {
        let newGame = true
        if newGame == true {
    }
    }
}

