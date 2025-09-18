//
//  ContentView.swift
//  Memorize
//
//  Created by Keyla Rosales on 9/10/25.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👽","👻","💀","🎃", "🤖", "😈", "🤡", "☃️"]
    @State var cardCount: Int = 4
    
    var body: some View {
        
        VStack{
            cards
            cardCountModifiers
        }.padding()
    }
    
    var cards: some View {
        HStack{
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content:emojis[index])
            }
        }.foregroundColor(.blue)
    }
    
    var removeCard: some View {
        Button(action:{
            if cardCount > 1{
                cardCount-=1
            }
        }, label:{
            Image(systemName: "rectangle.stack.badge.minus.fill")
        })
    }
    
    var addCard: some View {
        Button(action:{
            if cardCount < emojis.count{
                cardCount+=1
            }
            
        }, label:{
            Image(systemName: "rectangle.stack.badge.plus.fill")
        })
    }
    
    var cardCountModifiers: some View {
        HStack{
            removeCard
            Spacer()
            addCard
        }.imageScale(.large)
            .font(.largeTitle)
    }
    
    
}
 
struct CardView: View{
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View{
        ZStack {
            //constant: let - variable: var
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp{
                    base.fill(.white)
                    base.strokeBorder(lineWidth:2)
                    Text(content).font(.largeTitle)
                }
            else{
                    base
                }
        }.onTapGesture {
            isFaceUp.toggle() //  isFaceUp = !isFaceUp
        }
    }
}

#Preview {
    ContentView()
}
 
