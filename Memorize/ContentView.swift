//
//  ContentView.swift
//  Memorize
//
//  Created by Mark Ballereau on 31/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var mainColor: Color = .red
    
    @State var currentEmojis: [String] = []
    let emojisSports = ["🏉", "🏓", "⚽️", "🏊‍♂️", "🥏", "🏀", "🎾", "⚾️"]
    let emojisFoods = ["🍔", "🌭", "🥑", "🍗", "🥝", "🍫", "🍕"]
    let emojisAnimals = ["🙉", "🦁", "🐶", "🐥", "😸", "🦊"]
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            Spacer()
            cards
            Spacer()
            themeChoosers
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
            ForEach(0..<currentEmojis.count, id: \.self) { index in
                CardView(content: currentEmojis[index])
                    .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            }
        }
        .foregroundColor(mainColor)
    }
    
    var themeChoosers: some View {
        HStack {
            Spacer()
            themeChooser(symbol: "figure.run", label: "Sports", emojis: emojisSports, colorOfTheme: .red)
            Spacer()
            themeChooser(symbol: "carrot", label: "Foods", emojis: emojisFoods, colorOfTheme: .orange)
            Spacer()
            themeChooser(symbol: "pawprint", label: "Animals", emojis: emojisAnimals, colorOfTheme: .green)
            Spacer()
        }
    }
    
    func themeChooser (symbol: String, label: String, emojis: [String], colorOfTheme: Color) -> some View {
        Button (action: {
            currentEmojis = (emojis + emojis).shuffled()
            mainColor = colorOfTheme
        }, label: {
            VStack {
                Image(systemName:symbol)
                    .imageScale(.large)
                    .font(.title3)
                Text(label)
                    .font(.caption)
            }
        })
    }
}

struct CardView: View {
    let content: String
    @State var isFacedUp = true
    
    var body : some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFacedUp ? 1 : 0)
            base.fill().opacity(isFacedUp ? 0 : 1)
        }
        .onTapGesture {
            isFacedUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
