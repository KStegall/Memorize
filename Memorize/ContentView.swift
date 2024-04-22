//
//  ContentView.swift
//  Memorize
//
//  Created by Karston Stegall on 4/21/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻","🕺","💀","👺","😈","👻","🕺","💀","👺","😈"]
    
    @State var cardCount: Int = 4
    var body: some View {
        
        VStack {
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
        }.padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3,contentMode: .fit)
            }.foregroundColor(.orange)
        }
    }
    
    
    var cardCountAdjusters : some View{
        HStack {
            cardAdder
            Spacer()
            cardRemover
        }  .font(.largeTitle)
            .imageScale(.large)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View{
        Button(action : {
                cardCount += offset
        }, label:{
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View{
        cardCountAdjuster(by: -1,symbol:"minus.rectangle.portrait")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1,symbol:"plus.rectangle.portrait")
    }
}


struct CardView: View {
    @State var isFaceUp = false
    let content: String
    var body: some View {
        ZStack {
            
            let base = RoundedRectangle(cornerRadius:12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth:2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0 )
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
