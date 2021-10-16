//
//  ViewController.swift
//  SwiftQuiz
//
//  Created by Chinmoy Biswas on 11/10/21.
//

import UIKit

class QuizViewController: UIViewController {

    //MARK:- Outlet
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var qaLabel: UILabel!
    @IBOutlet weak var questionImaveView: UIImageView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    // From QuizBrain Struct
    var quizBrain = QuizBrain()
    
    
    // MARK: - Default Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    //MARK:- Button Pressed
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGortItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGortItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        // GoToResultViewController
        if quizBrain.curentQuestionNumber() + 1 == quizBrain.totalQuiz() {
            self.performSegue(withIdentifier: "goToResults", sender: self)
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) {_ in
            self.updateUI()
        }
    }
    
    //MARK: - SendToResultViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults" {
            
            let destinationVC = segue.destination as! ResultViewController
            let parsentice =  100.00 * Float(quizBrain.getScore()) / Float(quizBrain.totalQuiz())
            destinationVC.parsentice = parsentice
        }
    }
    
    // UpdateUI
    func updateUI() {
        buttonColorClear()
        let qNumber = quizBrain.getQuestionNumber()
        questionImaveView.image = quizBrain.getQuestionImg(qNumber+1)
        button1.setTitle(quizBrain.quize[qNumber].option[0], for: .normal)
        button2.setTitle(quizBrain.quize[qNumber].option[1], for: .normal)
        button3.setTitle(quizBrain.quize[qNumber].option[2], for: .normal)
        button4.setTitle(quizBrain.quize[qNumber].option[3], for: .normal)
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        qaLabel.text = "QA: \(quizBrain.curentQuestionNumber() + 1)/\(quizBrain.totalQuiz())"
    }
    
    func buttonColorClear() {
        button1.backgroundColor = UIColor.clear
        button2.backgroundColor = UIColor.clear
        button3.backgroundColor = UIColor.clear
        button4.backgroundColor = UIColor.clear
    }
    
}

