//
//  Question.swift
//  Quizzler
//
//  Created by Karthik Chowdary on 31/12/2017.
//  Copyright (c) 2017 Karthik Chowdary. All rights reserved.
//

import Foundation

class Question{
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool) {
        
        questionText = text
        answer = correctAnswer
    }
}
