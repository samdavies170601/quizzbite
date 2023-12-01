//
//  GameCardToolbarView.swift
//  quizzbite
//
//  Created by Sam Davies on 01/12/2023.
//

import SwiftUI

struct GameCardToolbarView: View {
    
    @State private var durationSelected = GameLogic.GameDuration.shortGame
    
    var body: some View {
        HStack(spacing: 32) {
            
            HStack {
                
                //Duration Selector
                ForEach(GameLogic.GameDuration.allCases, id: \.self) { duration in
                    Button(action: {
                        durationSelected = duration
                    }, label: {
                        Text("\(duration.rawValue)")
                        // TODO: Implement AppColor to set the specific colour of a selected and unselected duration.
                            .foregroundStyle(duration == durationSelected ? .blue : .gray)
                    })
                }
                
            }
            
            //Quick Play Button
            Button(action: {
                // TODO: Navigates to CountdownView and initialises the game.
            }, label: {
                // TODO: Implement the correct icon.
                Image(systemName: "play")
            })
            
        }
    }
}

#Preview {
    GameCardToolbarView()
}
