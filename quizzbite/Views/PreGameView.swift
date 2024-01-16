//
//  PreGameView.swift
//  quizzbite
//
//  Created by Sam Davies on 15/01/2024.
//

// TODO: Sort out the spacing between UI elements.
// TODO: Begin game once button is pressed.

import SwiftUI

struct PreGameView: View {
    
    @Binding var game: Game
    @Binding var isPresented: Bool
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            // MARK: - Game Title and Toolbar
            HStack {
                Text(game.name)
                    .font(AppFont.preGameTitle)
                Spacer()
                Button(action: {
                    isPresented = false
                }, label: {
                    Image(systemName: "x.circle")
                        .foregroundStyle(.black)
                })
            }
            .padding(.horizontal, 32.0)
            
            // MARK: - Game Description
            Text(game.description)
                .font(AppFont.preGameDescription)
                .foregroundStyle(.gray)
                .padding(.horizontal, 32.0)
            
            // MARK: - Game Start Button
            Button(action: {
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10.0)
                        .frame(width: 288, height: 66)
                        .foregroundStyle(.black)
                    Text("Start")
                        .font(AppFont.start)
                        .foregroundStyle(.white)
                }
            })
            .padding(.top, 16.0)
        }
        
    }
}

struct PreGameView_Preview: PreviewProvider {
    @State static private var game = Game(name: "Guess the Flag", description: "Test your knowledge of World Flags in this quiz: Guess the Flag!", highScoreShortGame: 1, highScoreMediumGame: 11, highScoreLongGame: 21)
    @State static private var isPresented = true
    static var previews: some View {
        PreGameView(game: $game, isPresented: $isPresented)
    }
}
