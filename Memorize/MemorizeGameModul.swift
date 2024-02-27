//
//  MemorizeGameMo.swift
//  Memorize
//
//  Created by Assem Seidkarim on 27.02.2024.
//

import Foundation

struct MemoryGame<CardContent>{
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card{
        var isFaceUp: Bool
        var isMatched: Bool
        var cintent: CardContent
    }
}
