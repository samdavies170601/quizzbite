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
                    // TODO: Import the custom font, Poppins, create an AppFont ViewModel and implement the font within each View.
                    Text(game.name).fontWeight(.semibold).font(.system(size: 18.0))
                    Spacer()
                }
                
                //game.description HStack
                HStack {
                    Text(game.description).fontWeight(.regular).font(.system(size: 12.0))
                        .foregroundStyle(.gray)
                        .frame(height: 30)
                    Spacer()
                }
                
                Spacer()
                
                //game.highScore HStack
                HStack {
                    // TODO: Implement a duration button to change the visible high score for each duration.
                    switch durationSelected {
                    case .shortGame:
                        Text("High Score: \(game.highScore30)").fontWeight(.medium).font(.system(size: 14.0))
                    case .mediumGame:
                        Text("High Score: \(game.highScore60)").fontWeight(.medium).font(.system(size: 14.0))
                    case .longGame:
                        Text("High Score: \(game.highScore90)").fontWeight(.medium).font(.system(size: 14.0))
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
