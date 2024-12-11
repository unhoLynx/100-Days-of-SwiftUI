//
//  ContentView.swift
//  WordScramble
//
//  Created by Dmitriy Rysev on 07.12.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    init(viewModel: ContentViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $viewModel.newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    Text("Current score: \(viewModel.score)")
                        .font(.title)
                }
                
                Section {
                    ForEach(viewModel.usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .toolbar {
                Button("Reset", action: viewModel.startGame)
            }
            .navigationTitle(viewModel.rootWord)
            //.onSubmit(viewModel.addNewWord)
            .onAppear(perform: viewModel.startGame)
            .onSubmit {
                withAnimation {
                    viewModel.addNewWord()
                }
            }
            .alert(viewModel.errorTitle, isPresented: $viewModel.showingError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(viewModel.errorMessage)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}
