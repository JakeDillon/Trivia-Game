//
//  Trivia Questions.swift
//  Trivia Game
//
//  Created by Jake Dillon on 10/9/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import Foundation

class TriviaQuestion {
    // String storing the text of the question
    let question: String
    
    // String array storing the potential answers to the question
    let answers: [String]
    
    // Store the index of the correct answers in the answers array
    let correctAnswersIndex: Int

    // computed property that returns the correct answer for the trivia question
    var correctAnswer: String {
        return answers[correctAnswersIndex]
    }
    
    init (question: String, answers: [String], correctAnswerIndex: Int) {
        self.question = question
        self.answers = answers
        self.correctAnswersIndex = correctAnswerIndex
    }
}
