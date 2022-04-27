//
//  Choice.swift
//  Destini-iOS13
//
//  Created by John on 16/03/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Choice {
    let text: String
    let nextMove: Int
    
    init(cT: String, nM: Int) {
        self.text = cT
        self.nextMove = nM
    }
    
}
