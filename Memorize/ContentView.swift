//
//  ContentView.swift
//  Memorize
//
//  Created by Keyla Rosales on 9/10/25.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👽","👻","💀","🎃", "🤖"]
    
    var body: some View {
        HStack{
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content:emojis[index])
            }
        }
        .foregroundColor(.blue)
        .padding()
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
 
