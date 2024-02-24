//
//  ContentView.swift
//  Memorize
//
//  Created by Assem Seidkarim on 24.02.2024.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🦁","🐶","🦋","🦀"]
    
    var body: some View {
        HStack{
                
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content: emojis[index])

            }
        }
        .foregroundStyle(.tint)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp = false
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
