//
//  GameCardListView.swift
//  quizzbite
//
//  Created by Sam Davies on 15/01/2024.
//

import SwiftUI

struct GameCardListView: View {
    
    @EnvironmentObject private var gameLogic: GameLogic
    
    var body: some View {
        
        // MARK: - GameCardView List
        ScrollView(.vertical) {
            ForEach(gameLogic.games) { game in
                GameCardView(game: binding(for: game))
                    .padding(.vertical, 16.0)
            }
        }
        
    }
}

extension GameCardListView {
    
    /// Creates a binding to a game.
    /// - Parameter game: the game to create a binding to.
    /// - Returns: a binding to the game, or if the game does not exist, raise a fatalError.
    func binding(for game: Game) -> Binding<Game> {
        guard let index = gameLogic.index(of: game) else {
            fatalError("Game Not Found")
        }
        return $gameLogic.games[index]
    }
    
}

#Preview {
    GameCardListView()
        .environmentObject(GameLogic())
}
