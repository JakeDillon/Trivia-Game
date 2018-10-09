//
//  ViewController.swift
//  Trivia Game
//
//  Created by Jake Dillon on 10/8/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var displayScore: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    @IBOutlet weak var answerFour: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
    resetButton.setTitle("reset", for: .normal)
    }

    @IBAction func resetButton(_ sender: Any) {
        let newGame = true
        if newGame == true {
    }
    }
    
    @IBAction func answeruButtonTapped(_ sender: Any) {
    }
}

