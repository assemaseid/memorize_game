//
//  EmojiMemoryGameVM.swift
//  Memorize
//
//  Created by Assem Seidkarim on 28.02.2024.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card

    private static let emojis: [String] = ["🦁","🐶","🦋","🦀","🦕","🐘", "🐏","🦚","🫎"]
    
    private static func creatememoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards:10) {pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁇"
            }
        }
    }
    
    @Published private var model = creatememoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    var color:Color {
        .blue
    }
    
    var score: Int {
        model.score
    }
    //MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card:Card) {
        model.choose(card)
    }
}
