//
//  ContentView.swift
//  quizzbite
//
//  Created by Sam Davies on 23/11/2023.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        ZStack {
            AppColor.background.ignoresSafeArea()
            VStack(spacing: 0) {
                // MARK: - Title
                HStack {
                    Text("Games")
                        .font(AppFont.title)
                        .padding(.horizontal, 32.0)
                    Spacer()
                }
                // MARK: - GameCardListView
                GameCardListView()
                    .environmentObject(GameLogic())
                
            }
        }
    }
}

#Preview {
    HomeView()
}
