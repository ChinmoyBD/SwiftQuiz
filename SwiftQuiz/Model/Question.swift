//
//  Question.swift
//  SwiftQuiz
//
//  Created by Chinmoy Biswas on 11/10/21.
//

import Foundation
import UIKit

//MARK:- Question Struct
struct Question {
    let question: UIImage
    let option: [String]
    let answer: String
    
    init(q: UIImage, o: [String], a: String) {
        question = q
        option = o
        answer = a
    }
}
