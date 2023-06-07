//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Dmitriy Rysev on 14.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTable = 2
    @State private var questionCount = 5
    
    @State private var playerAnswer = ""
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Picker("How many questions to ask", selection: $questionCount) {
                        ForEach(Array(stride(from: 5, to: 21, by: 5)), id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    Stepper("Practice tables up to \(selectedTable)",value: $selectedTable, in: 2...12)
                }
                
                Button("Start") {
                    startGame()
                }
                
                Section {
                    Text("\(Int.random(in: 2...12)) X \(Int.random(in: 2...12))")
                    TextField("", text: $playerAnswer)
                }
            }
            .listStyle(.insetGrouped)
        }
    }
    
    func startGame() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
