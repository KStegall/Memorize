//
//  ContentView.swift
//  Memorize
//
//  Created by Karston Stegall on 4/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack (content: {
            CardView()
            CardView()
            CardView()
            CardView()
        })
        
        .foregroundColor(.orange)
        .padding()
    }
}



struct CardView: View {
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            
            let base = RoundedRectangle(cornerRadius:12)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth:2)
                Text("👻").font(.largeTitle)
            }else {
                RoundedRectangle(cornerRadius:12)
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
