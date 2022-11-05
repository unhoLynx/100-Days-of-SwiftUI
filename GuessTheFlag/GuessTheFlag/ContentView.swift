//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Dmitriy Rysev on 03.11.2022.
//

import SwiftUI

struct FlagImage: View  {
    let name: String
    
    var body: some View {
        Image(name )
            .renderingMode(.original)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var showingWrong = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "USA"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                LinearGradient(gradient: Gradient(colors: [.black, .cyan]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                LinearGradient(gradient: Gradient(colors: [.cyan, .black]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
            }
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.headline.weight(.heavy))
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        FlagImage(name: countries[number])
                    }
                }
                
                Section {
                    Text("Current score: \(score)")
                        .foregroundColor(.white)
                        .font(.largeTitle.bold())
                }
                
            }
            
        }
        .alert(scoreTitle, isPresented: $showingWrong) {
            Button("Restart", action: askQuestion)
        }
    }
    
    func flagTapped (_ number: Int) {
        if number == correctAnswer {
            score += 1
            askQuestion()
        } else {
            scoreTitle = "Wrong, that's the flag of \(countries[number]). Your final score was \(score)"
            showingWrong = true
            score = 0
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
