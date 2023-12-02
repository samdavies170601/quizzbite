//
//  GameCardView.swift
//  quizzbite
//
//  Created by Sam Davies on 24/11/2023.
//

import SwiftUI

struct GameCardView: View {
    
    //State Variables
    @State private var durationSelected = GameLogic.GameDuration.shortGame
    
    //Constants
    let game: Game //a game instance
    
    var body: some View {
        ZStack {
            
            Color.gray.ignoresSafeArea() //temporary
            
            cardContent
            
        }
    }
}

extension GameCardView {
    
    //Card Content
    var cardContent: some View {
        ZStack {
            
            //GameCardView Button
            Button(action: {
                // TODO: Pressing the button should bring up the modal view.
            }, label: {
                RoundedRectangle(cornerRadius: 10.0)
                    .foregroundStyle(.white)
            })
            
            VStack(spacing: 0) {
                
                //game.name HStack
                HStack {
                    Text(game.name)
                        .font(AppFont.gameTitle)
                    Spacer()
                }
                
                //game.description HStack
                HStack {
                    Text(game.description)
                        .foregroundStyle(.gray)
                        .font(AppFont.gameDescription)
                        .frame(height: 35)
                    Spacer()
                }
                
                Spacer()
                
                //game.highScore HStack
                HStack {
                    // TODO: Refactor this section to include a single Text view rather than three.
                    switch durationSelected {
                    case .shortGame:
                        Text("High Score: \(game.highScore30)").font(AppFont.highScore)
                    case .mediumGame:
                        Text("High Score: \(game.highScore60)").font(AppFont.highScore)
                    case .longGame:
                        Text("High Score: \(game.highScore90)").font(AppFont.highScore)
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

// TODO: Learn the new preview system.
#Preview {
    GameCardView(game: Game(name: "Guess the Flag", description: "Test your knowledge of World Flags in this quiz: Guess the Flag!", highScore30: 1, highScore60: 11, highScore90: 21))
}
