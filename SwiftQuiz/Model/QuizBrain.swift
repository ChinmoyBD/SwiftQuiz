//
//  QuizBrain.swift
//  SwiftQuiz
//
//  Created by Chinmoy Biswas on 11/10/21.
//

import Foundation
import UIKit

struct QuizBrain {
    let quize = [
        Question(q: UIImage(named: "1")!, o: ["Galactica", "Serenity", "Optional(Galatica)", "nil"], a: "Galactica"),
        Question(q: UIImage(named: "2")!, o: ["-16,777,216", "-255", "16,777,216", "0"], a: "0"),
        Question(q: UIImage(named: "3")!, o: ["1", "2", "3", "This code will not compile"], a: "This code will not compile"),
        Question(q: UIImage(named: "4")!, o: ["Brought to you by Chris", "This code will not compile", "Brought to you by Joe", "This code will compile but crash"], a: "This code will not compile"),
        Question(q: UIImage(named: "5")!, o: ["1, 2", "1, 2, 3", "2", "2, 3"], a: "1, 2, 3"),
        Question(q: UIImage(named: "6")!, o: ["1000", "1000000", "1_000_000", "This code will not compile"], a: "1000"),
        Question(q: UIImage(named: "7")!, o: ["2, 4, 8, 16, 32, 64", "2, 4, 8, 16, 32, 64, 128", "4, 8, 16, 32, 64", "This code will not compile"], a: "This code will not compile"),
        Question(q: UIImage(named: "8")!, o: ["nil", "shiny", "0", "This code will not compile"], a: "shiny"),
        Question(q: UIImage(named: "9")!, o: ["I'm called Serenity!", "Nothing will be output", "I'm called TARDIS!", "This code will not compile"], a: "I'm called TARDIS!"),
        Question(q: UIImage(named: "10")!, o: ["Serenity", "Serenity, Sulaco", "Sulaco", "Serenity, Sulaco, Enterprise"], a: "Serenity, Sulaco"),
        Question(q: UIImage(named: "11")!, o: ["Bow ties are cool", "Bow", "Neck ties are cool", "This code will not compile"], a: "Bow ties are cool"),
        Question(q: UIImage(named: "12")!, o: ["5", "55", "50", "This code will not compile"], a: "55")
    ]
    
    var questionExist = [Int]()
    var score = 0
    var questionNumber = 0
    var randomNumber: Int = 0
    
    // Select Random
    mutating func randeom(exist: [Int], n: Int) -> Int {
        repeat {
            randomNumber = Int.random(in: 0..<n)
        } while(exist.contains(randomNumber))
        
        return randomNumber
    }
    
    mutating func getQuestionNumber() -> Int{
        let r =  randeom(exist: questionExist, n: quize.count)
        questionExist.append(r)
        return r
    }
    
    func getQuestionImg(_ imgNumber: Int) -> UIImage {
        print(imgNumber)
        return quize[imgNumber-1].question
    }
    
    // Check Answer
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quize[randomNumber].answer {
            print("Right")
            score += 1
            return true
        } else {
            print("Wrong!")
            return false
        }
    }
    
    // Next Question
    mutating func nextQuestion() {
        if questionNumber + 1 < quize.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
            questionExist = []
        }
    }
    
    // Score
    func getScore() -> Int {
        return score
    }
    
    // Question Number
    func curentQuestionNumber() -> Int {
        return questionNumber
    }
    
    func totalQuiz() -> Int {
        return quize.count
    }
    
}
