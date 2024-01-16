//
//  GameLogic.swift
//  quizzbite
//
//  Created by Sam Davies on 01/12/2023.
//

import Foundation

class GameLogic: ObservableObject {
    
    /// The games array.
    @Published var games = Game.games
    
    /// The duration of a single game.
    enum GameDuration: Int, CaseIterable {
        case shortGame = 30
        case mediumGame = 60
        case longGame = 90
    }
    
    /// Finds the index of a Game in the games array.
    /// - Parameter game: the game to find the index of.
    /// - Returns: the index of the game in the games array, or nil if the game does not exist.
    func index(of game: Game) -> Int? {
        for i in games.indices {
            if games[i].id == game.id {
                return i
            }
        }
        return nil
    }
    
}
