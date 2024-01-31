//
//  ContentView.swift
//  Memorize
//
//  Created by Mark Ballereau on 31/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CardView(content: "👻")
            .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFacedUp = false
    
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
