//
//  ContentView.swift
//  Memorize
//
//  Created by Keyla Rosales on 9/10/25.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👽","👻","💀","🎃", "🤖", "😈", "🤡", "☃️", "🐹", "🐇", "🐻", "🐼"]
    @State var cardCount: Int = 4
    
    var body: some View {
        
        VStack{
            ScrollView{
                cards
            }

            cardCountModifiers
        }.padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]){
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content:emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }.foregroundColor(.blue)
    }
    
    var cardCountModifiers: some View {
        HStack{
            removeCard
            Spacer()
            addCard
        }.imageScale(.large)
            .font(.largeTitle)
    }
    
    func cardCountManager(by increment: Int, symbol: String) -> some View {
        Button(action:{
                cardCount += increment
            }
        , label:{
            Image(systemName: symbol)
        })
        .disabled(cardCount + increment < 1 || cardCount + increment > emojis.count)
    }
    
    var removeCard: some View {
        cardCountManager(by:-1, symbol:"rectangle.stack.badge.minus.fill")
    }
    
    var addCard: some View {
        cardCountManager(by:+1, symbol:"rectangle.stack.badge.plus.fill")
    }
    
}
 
struct CardView: View{
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View{
        ZStack {
            //constant: let - variable: var
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            
            Group{
                    base.fill(.white)
                    base.strokeBorder(lineWidth:2)
                    Text(content).font(.largeTitle)
                }
                .opacity(isFaceUp ? 1 : 0)
                base.fill().opacity(isFaceUp ?  0 : 1)
            
        }.onTapGesture {
            isFaceUp.toggle() //  isFaceUp = !isFaceUp
        }
    }
}

#Preview {
    ContentView()
}
 
