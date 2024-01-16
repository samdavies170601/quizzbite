//
//  GameCardView.swift
//  quizzbite
//
//  Created by Sam Davies on 24/11/2023.
//

// TODO: Learn the new preview system.

import SwiftUI

struct GameCardView: View {
    
    @State private var durationSelected = GameLogic.GameDuration.shortGame
    @State private var isPresented = false //is the modal (PreGameView) selected
    @Binding var game: Game
    let modalHeight = 0.33
    
    var body: some View {
        
        ZStack {
            
            cardContent
                .sheet(isPresented: $isPresented, content: {
                    PreGameView(game: $game, isPresented: $isPresented)
                        .presentationDetents([.fraction(modalHeight)])
                })
            
        }
        
    }
}

extension GameCardView {
    
    var cardContent: some View {
        ZStack {
            
            // MARK: - Button
            Button(action: {
                isPresented = true
            }, label: {
                RoundedRectangle(cornerRadius: 10.0)
                    .foregroundStyle(.white)
            })
            
            VStack(spacing: 0) {
                // MARK: - Game Name
                HStack {
                    Text(game.name)
                        .font(AppFont.gameTitle)
                    Spacer()
                }
                // MARK: - Game Description
                HStack {
                    Text(game.description)
                        .foregroundStyle(.gray)
                        .font(AppFont.gameDescription)
                        .frame(height: 35)
                    Spacer()
                }
                Spacer()
                // MARK: - Game High Scores and Toolbar
                HStack {
                    // TODO: Refactor this section to include a single Text view rather than three.
                    switch durationSelected {
                    case .shortGame:
                        Text("High Score: \(game.highScoreShortGame)").font(AppFont.highScore)
                    case .mediumGame:
                        Text("High Score: \(game.highScoreMediumGame)").font(AppFont.highScore)
                    case .longGame:
                        Text("High Score: \(game.highScoreLongGame)").font(AppFont.highScore)
                    } //the high score text changes for each duration
                    Spacer()
                    GameCardToolbarView(durationSelected: $durationSelected) //this includes the duration selector and the quick play button
                }
        
            }
            .padding(16.0)
            
        }
        .aspectRatio(3.05, contentMode: .fit)
        .frame(maxWidth: 366.0, maxHeight: 120.0)
        .padding(.horizontal, 32.0)
        
    }
    
}

struct GameCardView_Preview: PreviewProvider {
    @State static private var game = Game(name: "Guess the Flag", description: "Test your knowledge of World Flags in this quiz: Guess the Flag!", highScoreShortGame: 1, highScoreMediumGame: 11, highScoreLongGame: 21)
    static var previews: some View {
        GameCardView(game: $game)
    }
}
