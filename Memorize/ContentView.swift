//
//  ContentView.swift
//  Memorize
//
//  Created by Assem Seidkarim on 24.02.2024.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🦁","🐶","🦋","🦀","🦕","🐘", "🐏","🦚","🫎","🐝"]
    @State var cardCount:Int = 4

    
    var body: some View {
        VStack{
            cards
            cardCountAdjasters
            
        }
        .imageScale(.large)
        .font(.largeTitle)
        .padding()
    }
    
    var cards: some View {
        HStack{
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content: emojis[index])

            }
            .foregroundStyle(.tint)
        }
    }
    
    var cardCountAdjasters:some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
    }
    
    var cardAdder: some View {
        Button(action: {
            if cardCount < emojis.count {
                cardCount += 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.fill.badge.plus")
        })
    }
    
    var cardRemover:some View {
        Button(action: {
            if cardCount > 1 {
                cardCount -= 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.minus.fill")
        })
    }
    
}

struct CardView: View {
    @State var isFaceUp = true
    let content:String
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}







#Preview {
    ContentView()
}
