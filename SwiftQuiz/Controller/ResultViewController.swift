//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Chinmoy Biswas on 15/10/21.
//

import UIKit

class ResultViewController: UIViewController {
    
    var parsentice: Float?

    @IBOutlet weak var resultStatusLabel: UILabel!
    @IBOutlet weak var suggestionLabel: UILabel!
    
    // MARK: - Default Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    // MARK: - ButtonAction
    @IBAction func tryAgainButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        print("dismiss")
    }
    
    //MARK: - UpdateUI
    func updateUI() {
        if parsentice! >= 80.0 {
            resultStatusLabel.text = "Congratulations"
            resultStatusLabel.textColor = .green
            suggestionLabel.text = "We appreciate your hard work"
        } else {
            resultStatusLabel.text = "Opps..."
            resultStatusLabel.textColor = .red
            suggestionLabel.text = "You should prectice more"
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
