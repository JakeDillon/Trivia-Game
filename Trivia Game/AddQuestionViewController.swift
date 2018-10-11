//
//  AddQuestionViewController.swift
//  Trivia Game
//
//  Created by Jake Dillon on 10/11/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import UIKit

class AddQuestionViewController: UIViewController {

    @IBOutlet weak var textFieldQuestion: UITextField!
    @IBOutlet weak var textFieldAnswer: UITextField!
    @IBOutlet weak var textFieldAnswerTwo: UITextField!
    @IBOutlet weak var textFieldAnswerThree: UITextField!
    @IBOutlet weak var textFieldAnswerFour: UITextField!
    
    @IBOutlet weak var segmentController: UISegmentedControl!
    
    var newQuestion: TriviaQuestion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let destination = segue.destination as? ViewController{
        destination.questions.append(newQuestion)
        }
    }
    
    
    
    
    func showErrorAlert() {
        let errorAlert = UIAlertController(title: "Error", message: "Please enter text in all fields, or hit the back button to go back to the quiz.", preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "CLose", style: .default, handler: nil)
        errorAlert.addAction(dismissAction)
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    
    @IBAction func submitButton(_ sender: Any) {
   // make sure each txt field has txt
        guard let question = textFieldQuestion.text, !question.isEmpty,
        let answer1 = textFieldAnswer.text, !answer1.isEmpty,
        let answer2 = textFieldAnswerTwo.text, !answer2.isEmpty,
        let answer3 = textFieldAnswerThree.text, !answer3.isEmpty,
        let answer4 = textFieldAnswerFour.text, !answer4.isEmpty else {
       showErrorAlert()
            return
        }
        newQuestion = TriviaQuestion(question: question, answers: [answer1, answer2, answer3, answer4], correctAnswerIndex: segmentController.selectedSegmentIndex)
        
        self.performSegue(withIdentifier: "unwindToQuizScreen", sender: self)
    }
    
}

