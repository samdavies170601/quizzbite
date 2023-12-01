//
//  GameCardView.swift
//  quizzbite
//
//  Created by Sam Davies on 24/11/2023.
//

import SwiftUI

struct GameCardView: View {
    
    //Game Instance
    let game: Game
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea() //temporary
            
            gameCardContent
            
        }
    }
}

extension GameCardView {
    
    //Game Card Content
    var gameCardContent: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundStyle(.white)
            
            // MARK: - Start of Card Content VStack
            VStack(spacing: 0) {
                
                HStack {
                    // TODO: Import the custom font, Poppins, create an AppFont ViewModel and implement the font within each View.
                    Text(game.name).fontWeight(.semibold).font(.system(size: 18.0))
                    Spacer()
                }
                //.border(.black)
                
                HStack {
                    Text(game.description).fontWeight(.regular).font(.system(size: 12.0))
                        .foregroundStyle(.gray)
                        .frame(height: 30)
                    Spacer()
                }
                //.border(.black)
                
                Spacer()
                
                HStack {
                    // TODO: Implement a duration button to change the visible high score for each duration.
                    Text("High Score: \(game.highScore30)").fontWeight(.medium).font(.system(size: 14.0))
                    Spacer()
                }
                //.border(.black)
        
            }
            .padding(16.0)
            //.border(.black)
            // MARK: - End of Card Content VStack
            
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
