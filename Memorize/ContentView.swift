//
//  ContentView.swift
//  Memorize
//
//  Created by Assem Seidkarim on 24.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundStyle(.tint)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text("👻").font(.largeTitle)
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
