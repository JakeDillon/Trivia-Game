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
    @IBOutlet weak var questionLabel: UILabel!
    
    
    // the current question that is being answered
    var currentQuestions: TriviaQuestion! {
        
        didSet {
            //whenever a new current question
            questionLabel.text = currentQuestions.question
            answerOne.setTitle(currentQuestions.answers[0], for: .normal)
            answerTwo.setTitle(currentQuestions.answers[1], for: .normal)
            answerThree.setTitle(currentQuestions.answers[2], for: .normal)
            answerFour.setTitle(currentQuestions.answers[3], for: .normal)
        }
    }
    // the array of questions for the trivia game
    var questions: [TriviaQuestion] = []
    
    // this array will hold all the of the questionsthat have been answered
    var questionPlaceHolder: [TriviaQuestion] = []
    
    var score = 0{
        didSet {
            displayScore.text = "\(score)"
        }
    }
    
    var randomIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        populateQuestions()
        getNewQuestion()
    }
    // This will be used to populate our questions array when the app loads
    func populateQuestions() {
        let questionOne = TriviaQuestion(question: "What is the name of the bass player/lead singer of the band Motorhead", answers: ["Lemmy Kilmister", "Ronnie James Dio", "Sebastian Bach", "Corey Taylor"], correctAnswerIndex: 0)
        
        let questionTwo = TriviaQuestion(question: "The Motley Crue album and song titled \"Shout at the Devil\" was not the original name given by Nikki Sixx, what was the original name?", answers: ["Death to all but Metal", "Devil's Own", "Rainbow in the Dark", "Shout to the Devil"], correctAnswerIndex: 3)
        
        let questionThree = TriviaQuestion(question: "Who was the original lead singer of the band Van Halen?", answers: ["Ozzy Osbourne", "Sammy Hager", "WolfGang Van Halen", "David Lee Roth"], correctAnswerIndex: 3)
        
        let questionFour = TriviaQuestion(question: "What two bands is Corey Taylor currently the lead singer for?", answers: ["Nine Inch and Limp Bizkit", "Slipknot and Stone Sour", "Buckcherry and Sixx AM", "Black ButterFly and Audacious P"], correctAnswerIndex: 1)
        
        let questionFive = TriviaQuestion(question: "Lead singer of Black Veil Brides and solo artist Andy Biersack had a leading role in what 2017 film?", answers: ["L.A. Saints", "Came From Nothing", "American Satan", "The American Dream"], correctAnswerIndex: 2)
    let questionSix = TriviaQuestion(question: "Micheal Starr, Lexi Foxx, Styx, and Satchel make what comdeic glam metal band?", answers: ["Iron Maiden", "Seven Minutes in Heaven", "Hillbilly Casino", "Steel Panther"], correctAnswerIndex: 3)
        let questionSeven = TriviaQuestion(question: "Known as one of the greatest guitar players ever, Eddy Van Halen originally started playing on what instrument?", answers: ["vocals", "bass guitar", "keyboard", "drums"], correctAnswerIndex: 3)
        let questionEight = TriviaQuestion(question: "Which of the following bands have not won a Grammy?", answers: ["Slayer", "Anthrax", "Slipknot", "Ghost"], correctAnswerIndex: 1)
        let questionNine = TriviaQuestion(question: "Which of the following people are in a successful heavy metal band and also have had a successful professional wrestling carrer", answers: ["Chris Jericho", "Dave Bautista", "Kenny Omega", "Sid Wilson"], correctAnswerIndex: 0)
        let questionTen = TriviaQuestion(question: "Who was the original bass player for the band Five Finger Death Punch", answers: ["Kris Kael", "Geddy Lee", "Matt Snell", "Flea"], correctAnswerIndex: 2)
        let questionEleven = TriviaQuestion(question: "What was the name of the famous guitar player for Pantera that was shot and killed on stage in 2004?", answers: ["Jason Hook", "Tommy Shaw", "Mick Mars", "Darrell Abbott"], correctAnswerIndex: 3)
        let questionTwelve = TriviaQuestion(question: "What was the first studio album released by AC/DC? ", answers: ["T.N.T.", "For Those About To Rock", "Who Made Who", "Powerage"], correctAnswerIndex: 0)
        let questionThirteen = TriviaQuestion(question: "Who was Ozzy Osbourne's replacement when left Black Sabbath?", answers: ["Ted Nuggent", "Ronnie James Dio", "Dennis Deyoung", "Bon Scott"], correctAnswerIndex: 1)
        let questionForteen = TriviaQuestion(question: "What bands makes up The Big Four of thrash metal bands?", answers: ["Hatebreed, In This Moment, Judist Priest, Amon Amarth", "Black Veil Brides, Pierce the Veil, Falling in Reverse, We Came as Romans", "Slayer, Metallica, Anthrax, Megadeth", "Testament, Exodus, Testament, Overkill"], correctAnswerIndex: 2)
        let questionFifteen = TriviaQuestion(question: "How many members are in the band Slipknot?", answers: ["three", "seven", "ten", "nine"], correctAnswerIndex: 3)
        let questionSixteen = TriviaQuestion(question: "The band Volbet is from what country?", answers: ["Brazil", "England", "USA", "Denmark"], correctAnswerIndex: 3)
        
        questions = [questionOne, questionTwo, questionThree, questionFour, questionFive, questionSix, questionSeven, questionEight, questionNine, questionTen, questionEleven, questionTwelve, questionThirteen, questionForteen, questionFifteen, questionSixteen]
    }
    
    // this function will be used to get a random question from our array of questions
    func getNewQuestion() {
        if questions.count > 0 {
        // get a random index from 0 to 1 less than a number of elements in the questions array
        
        randomIndex = Int(arc4random_uniform(UInt32(questions.count)))
        // set currentQuestion equal to the question that is at the random index in the question array
        
        currentQuestions = questions[randomIndex]
    } else {
        resetGame()
    
    }
    }
    
    func showCorrectAnswerAlert() {
        let correctAlert = UIAlertController(title: "correct", message: "(currentQuestions.correctAnswer) was the correct answer", preferredStyle: .actionSheet)
        let closeAction = UIAlertAction(title: "close", style: .default) { _ in
            self.questionPlaceHolder.append(self.questions.remove(at: self.randomIndex))
            self.getNewQuestion()
        }
        correctAlert.addAction(closeAction)
        self.present(correctAlert, animated: true, completion: nil)
    }
    func showIncorrectAnswerAlert() {
        let incorrectAlert = UIAlertController(title: "wrong", message: "(currentQuestions.correctAnswer) was the correct answer", preferredStyle: .actionSheet)
        let closeAction = UIAlertAction(title: "close", style: .default) { _ in
            self.questionPlaceHolder.append(self.questions.remove(at: self.randomIndex))
            self.getNewQuestion()
        }
        incorrectAlert.addAction(closeAction)
        self.present(incorrectAlert, animated: true, completion: nil)
    }
    
    func resetGame() {
        //reset score
        score = 0
        //repopulate the questions array with th equestions in the placeholder
        if !questions.isEmpty {
            // if we have questions remaining append all all of the remaining questions to the placeHolder array
            questionPlaceHolder.append(contentsOf: questions)
        }
        questions = questionPlaceHolder
        
        // get new question
    }
    
    // restart button function
    @IBAction func resetButton(_ sender: Any) {
        let newGame = true
        if newGame == true {
        }
    }
    
    // answer button function
    @IBAction func answeruButtonTapped(_ sender: UIButton) {
        if sender.tag == currentQuestions.correctAnswersIndex {
            //they got the question right so need to let them know
            showCorrectAnswerAlert()
            score += 1
        }else{
            // they got th equestion wrong so we need to let them know
            showIncorrectAnswerAlert()
        }
        
    }
}

