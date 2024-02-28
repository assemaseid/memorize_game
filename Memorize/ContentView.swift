//
//  ContentView.swift
//  Memorize
//
//  Created by Assem Seidkarim on 24.02.2024.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🦁","🐶","🦋","🦀","🦕","🐘", "🐏","🦚","🫎"]
    
    var body: some View {
        ScrollView{
            cards
        }.padding()
            
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content: emojis[index])
                        .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.tint)
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
