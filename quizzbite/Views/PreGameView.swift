//
//  PreGameView.swift
//  quizzbite
//
//  Created by Sam Davies on 15/01/2024.
//

import SwiftUI

struct PreGameView: View {
    
    //Bindings
    @Binding var game: Game
    @Binding var isPresented: Bool
    
    var body: some View {
        
        // TODO: Sort out the spacing between UI elements.
        VStack(spacing: 0) {
            
            //Game Title
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
            
            Text(game.description)
                .font(AppFont.preGameDescription)
                .foregroundStyle(.gray)
                .padding(.horizontal, 32.0)
            
            Button(action: {
                // TODO: Begin game once button is pressed.
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
    @State static private var game = Game(name: "Guess the Flag", description: "Test your knowledge of World Flags in this quiz: Guess the Flag!", highScore30: 1, highScore60: 11, highScore90: 21)
    @State static private var isPresented = true
    static var previews: some View {
        PreGameView(game: $game, isPresented: $isPresented)
    }
}
