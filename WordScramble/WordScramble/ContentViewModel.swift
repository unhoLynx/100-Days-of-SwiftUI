// Created for WordScramble by Dmitrii Rysev in 2024
// Using Swift 5.0

import Foundation

final class ContentViewModel: ObservableObject {
    @Published var usedWords = [String]()
    @Published var rootWord = ""
    @Published var newWord = ""
    
    @Published var errorTitle = ""
    @Published var errorMessage = ""
    @Published var showingError = false
    
    @Published var score = 0
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        guard isLongEnough(word: answer) else {
            wordError(title: "Word is too short", message: "It has to be at least 3 letters long")
            return
        }
        
        guard isNotSame(word: answer) else {
            wordError(title: "Word is the same as the root word", message: "You can't use it")
            return
        }
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        usedWords.insert(answer, at: 0)
        score += answer.count
        newWord = ""
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "headline"
                usedWords.removeAll()
                score = 0
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isLongEnough(word: String) -> Bool {
        word.count > 2
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isNotSame(word: String) -> Bool {
        !(word == rootWord)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
               if let pos = tempWord.firstIndex(of: letter) {
                   tempWord.remove(at: pos)
               } else {
                   return false
               }
           }
        
        return true
    }
    
//    func isReal(word: String) -> Bool {
//        let checker = UITextChecker()
//        let range = NSRange(location: 0, length: word.utf16.count)
//        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
//
//        return misspelledRange.location == NSNotFound
//    }
    
    func isReal(word: String) -> Bool {
            let range = NSRange(location: 0, length: word.utf16.count)
            let tagger = NSLinguisticTagger(tagSchemes: [.lexicalClass], options: 0)
            tagger.string = word
            let options: NSLinguisticTagger.Options = [.omitWhitespace, .omitPunctuation, .joinNames]
            let tags = tagger.tags(in: range, unit: .word, scheme: .lexicalClass, options: options, tokenRanges: nil)
            
            return tags.contains(.word)
        }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}
