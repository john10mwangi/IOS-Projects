//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain{
    
    var storyPosition = 0
    
    let stories = [
        Story(
            0,
            "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: 'Need a ride, boy?'.",
            Choice(cT:"I'll hop in. Thanks for the help!",nM:2),
            Choice(cT:" Better ask him if he's a murderer first.",  nM:1)
        ),
        Story(
            1,
            "He nods slowly, unfazed by the question.",
            Choice(cT:"At least he's honest. I'll climb in.",nM:2),
            Choice(cT:" Wait, I know how to change a tire.",  nM:3)
        ),
        Story(
            2,
            "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.",
            Choice(cT:"I love Elton John! Hand him the cassette tape.",nM:5),
            Choice(cT:"It's him or me! You take the knife and stab him.",  nM:4)
        ),
        Story(
            3,
            "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?",
            Choice(cT:"The",nM:0),
            Choice(cT:" End",  nM:0)
        ),
        Story(
            4,
            "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.",
            Choice(cT:"The",nM:0),
            Choice(cT:" End",  nM:0)
        ),
        Story(
            5,
            "You bond with the murderer while crooning verses of 'Can you feel the love tonight'. He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: 'Try the pier.'",
            Choice(cT:"The",nM:0),
            Choice(cT:" End",  nM:0))
    ]
    
    func getStoryText() -> String {
        return stories[storyPosition].title
    }
    
    func getChoice1() -> Choice {
        return stories[storyPosition].choice1
    }
    
    func getChoice2() -> Choice {
        return stories[storyPosition].choice2
    }
    
    mutating func onClick(_ text: String){
        let next = stories[storyPosition].chechChoice(choiceText: text)
        
        if let fooOffset = stories.firstIndex(where: {$0.storyId == next}) {
            // do something with fooOffset
            self.storyPosition = fooOffset
        } else {
            // item could not be found
            print("item not found")
        }
    }
}
