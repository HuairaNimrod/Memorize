//
//  ContentView.swift
//  Memorize
//
//  Created by Keyla Rosales on 9/10/25.
//

import SwiftUI

struct ContentView: View {
    static let halloween: Array<String> = ["🎃", "👻", "💀", "😈", "👺", "🦇"]
    static let animals: Array<String> = ["🐹", "🐱", "🦊", "🐸", "🐵", "🐰"]
    static let vehicles: Array<String> = ["✈️", "🚗", "🛵", "🚁", "🚂", "🚲"]
    
    @State var cardCount: Int = 4
    @State var currTheme: Array<String> = halloween
    
    var body: some View {
        
        VStack{
            cardCountModifiers
            ScrollView{
                cards
            }
            themeModifiers
        }.padding()
    }
    
    var cardGameTitle: some View {
        Text("Memorize!")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]){
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content:currTheme[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }.foregroundColor(.blue)
    }
    
    var cardCountModifiers: some View {
        HStack{
            removeCard
            Spacer()
            cardGameTitle
            Spacer()
            addCard
        }.imageScale(.large)
            
    }
    
    func cardCountManager(by increment: Int, symbol: String) -> some View {
        Button(action:{
                cardCount += increment
            }
        , label:{
            Image(systemName: symbol)
        })
        .disabled(cardCount + increment < 1 || cardCount + increment > currTheme.count)
    }
    
    var removeCard: some View {
        cardCountManager(by:-1, symbol:"rectangle.stack.badge.minus.fill")
    }
    
    var addCard: some View {
        cardCountManager(by:+1, symbol:"rectangle.stack.badge.plus.fill")
    }
//    
    func cardThemeManager(theme: Array<String>, symbol: String, title: String) -> some View {
        Button(action:{
            currTheme = theme
            }
        , label:{
            VStack{
                Image(systemName: symbol)
                Text(title)
            }
        })
    }
    var theme1: some View {
        cardThemeManager(theme: ContentView.halloween, symbol: "cat", title: "Halloween")
    }
    var theme2: some View {
        cardThemeManager(theme: ContentView.vehicles, symbol: "car", title: "Vehicles")
    }
    var theme3: some View {
        cardThemeManager(theme: ContentView.animals, symbol: "dog", title: "Animals")
    }
    var themeModifiers: some View {
        HStack{
            Spacer()
            theme1
            Spacer()
            theme2
            Spacer()
            theme3
            Spacer()
        }
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
 
