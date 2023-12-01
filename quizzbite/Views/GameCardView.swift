//
//  GameCardView.swift
//  quizzbite
//
//  Created by Sam Davies on 24/11/2023.
//

import SwiftUI

struct GameCardView: View {
    
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
            
            Button(action: {
                // TODO: Pressing the button should bring up the modal view.
            }, label: {
                RoundedRectangle(cornerRadius: 10.0)
                    .foregroundStyle(.white)
            })
            
            VStack(spacing: 0) {
                
                HStack {
                    // TODO: Import the custom font, Poppins, create an AppFont ViewModel and implement the font within each View.
                    Text(game.name).fontWeight(.semibold).font(.system(size: 18.0))
                    Spacer()
                }
                
                HStack {
                    Text(game.description).fontWeight(.regular).font(.system(size: 12.0))
                        .foregroundStyle(.gray)
                        .frame(height: 30)
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    // TODO: Implement a duration button to change the visible high score for each duration.
                    Text("High Score: \(game.highScore30)").fontWeight(.medium).font(.system(size: 14.0))
                    Spacer()
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
    GameCardView(game: Game(name: "Guess the Flag", description: "Test your knowledge of World Flags in this quiz: Guess the Flag!", highScore30: 0, highScore60: 0, highScore90: 0))
}
