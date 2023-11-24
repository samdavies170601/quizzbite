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
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .foregroundStyle(.white)
                
                //Game Stack
                VStack {
                    
                    //Game.name Stack
                    HStack {
                        Text(game.name).fontWeight(.semibold).font(.system(size: 18.0)) //need to import a custom font and sort out font sizing and font weight
                        Spacer()
                    }
                    
                    //Game.description Stack
                    HStack {
                        Text(game.description).fontWeight(.regular).font(.system(size: 12.0)) //need to sort out the available space for the description text to use
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                    
                    Spacer()
                    
                    //Game.highScore Stack
                    HStack {
                        Text("High Score: \(game.highScore30)").fontWeight(.medium).font(.system(size: 14.0)) //depends on the output of the duration selection button
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
}

#Preview {
    GameCardView(game: Game(name: "Guess the Flag", description: "Test your knowledge of World Flags in this quiz: Guess the Flag!", highScore30: 0, highScore60: 0, highScore90: 0))
}
