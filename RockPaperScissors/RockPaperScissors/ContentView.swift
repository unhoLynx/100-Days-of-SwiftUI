//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Dmitriy Rysev on 02.12.2022.
//

import SwiftUI

struct ContentView: View {
    let moves = ["🪨", "📃", "✂️"]
    @State private var computerChoice = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    
    @State private var score = 0
    @State private var questionCount = 1
    @State private var showingResults = false
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Text("Computer's choice:")
                .font(.largeTitle)
                .foregroundColor(.primary)
                .padding(5)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            Text("\(moves[computerChoice])")
                .font(.system(size: 200))
            
            Spacer()
            
            if shouldWin {
                Text("Which one wins?")
                    .font(.largeTitle)
                    .padding(5)
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            } else {
                Text("Which one loses?")
                    .font(.largeTitle)
                    .padding(5)
                    .background(.red)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
            HStack {
                ForEach(0..<3) { number in
                    Button(moves[number]) {
                        play(choice: number)
                    }
                }
                .font(.system(size: 100))
            }
            
            Spacer()
            
            Text("Current score: \(score)")
                .font(.subheadline)
                .padding(5)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Spacer()
        }
        .alert("Game is over!", isPresented: $showingResults) {
            Button("Restart", action: reset)
        } message: {
            Text("Your final score is \(score)/10")
        }
    }
    
    func play(choice: Int) {
        let winningMoves = [1, 2, 0]
        let didWin: Bool
        
        if shouldWin {
            didWin = choice == winningMoves[computerChoice]
        } else {
            didWin = computerChoice == winningMoves[choice]
        }
        
        if didWin {
            score += 1
        }
        
        if questionCount == 10 {
            showingResults = true
        } else {
            questionCount += 1
            computerChoice = Int.random(in: 0..<3)
            shouldWin = Bool.random()
        }
    }
    
    func reset() {
        questionCount = 0
        score = 0
        computerChoice = Int.random(in: 0..<3)
        shouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
