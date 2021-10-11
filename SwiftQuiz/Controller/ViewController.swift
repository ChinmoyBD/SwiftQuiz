//
//  ViewController.swift
//  SwiftQuiz
//
//  Created by Chinmoy Biswas on 11/10/21.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- Outlet
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var qaLabel: UILabel!
    @IBOutlet weak var questionImaveView: UIImageView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
    }
}

