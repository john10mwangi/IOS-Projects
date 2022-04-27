//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story {
    let storyId: Int
    let title: String
    let choice1: Choice
    let choice2: Choice
    
    init(_ id: Int, _ t: String, _ c1: Choice, _ c2: Choice) {
        self.storyId = id
        self.choice1 = c1
        self.choice2 = c2
        self.title = t
    }
    
    func chechChoice(choiceText: String) -> Int {
        if choice2.text == choiceText {
            return choice2.nextMove
        }else {
            return choice1.nextMove
        }
    }
}
