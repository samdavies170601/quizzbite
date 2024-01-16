//
//  Game.swift
//  quizzbite
//
//  Created by Sam Davies on 24/11/2023.
//

import Foundation

struct Game: Identifiable {
    
    let id = UUID()
    
    let name: String
    let description: String
    
    var highScoreShortGame: Int
    var highScoreMediumGame: Int
    var highScoreLongGame: Int
    
}

extension Game {
    
    /// The games array.
    static var games: [Game] {
        [Game(name: "Guess the Flag", description: "Test your knowledge of World Flags in this quiz: Guess the Flag!", highScoreShortGame: 1, highScoreMediumGame: 11, highScoreLongGame: 21),
        
        ]
    }
    
}
