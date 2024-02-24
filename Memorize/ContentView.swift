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
    var isFaceUp:Bool = false
    var body: some View {
        if isFaceUp{
            ZStack (content:{
                       RoundedRectangle(cornerRadius: 25.0)
                           .foregroundColor(.white)
                       RoundedRectangle(cornerRadius: 25.0)
                           .strokeBorder(lineWidth: 5)
                       Text("👻").font(.largeTitle)
            })
        }else{
            RoundedRectangle(cornerRadius: 25.0)
        }
       
    }
}







#Preview {
    ContentView()
}
