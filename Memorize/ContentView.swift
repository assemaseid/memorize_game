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
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjasters
            
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
                ForEach(0..<cardCount, id: \.self){ index in
                CardView(content: emojis[index])
                        .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.tint)
    }
    
    var cardCountAdjasters:some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
        .padding()
    }
    func cardCountAdjasters(by offset: Int, symbol: String) -> some View {
        Button(action: {
                cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardAdder: some View {
        cardCountAdjasters(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var cardRemover:some View {
        cardCountAdjasters(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
}

struct CardView: View {
    @State var isFaceUp = true
    let content:String
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 10.0)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}







#Preview {
    ContentView()
}
