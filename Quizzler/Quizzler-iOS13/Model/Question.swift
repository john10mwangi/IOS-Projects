//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by John on 16/03/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.answer = a
        self.text = q
        self.correctAnswer = correctAnswer
    }
}
