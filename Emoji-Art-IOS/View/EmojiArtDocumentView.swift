//
//  EmojiArtDocumentView.swift
//  Emoji-Art-IOS
//
//  Created by jatin foujdar on 14/06/25.
//

import SwiftUI


struct EmojiArtDocumentView: View {
    private let PaletteEmojiSize: CGFloat = 40
    @ObservedObject  var document : EmojiArtDocument
    
    private let emojis = "👻🍎😃🤪☹️🤯🐶🐭🦁🐵🦆🐝🐢🐄🐖🌲🌴🌵🍄🌞🌎🔥🌈🌧️🌨️☁️⛄️⛳️🚗🚙🚓🚲🛺🏍️🚘✈️🛩️🚀🚁🏰🏠❤️💤⛵️"
    var body: some View{
        VStack(spacing: 0){
            documentBody
            Color.yellow
            ScrollingEmojis(emojis)
                .font(.system(size: PaletteEmojiSize))
                .padding(.horizontal)
                .scrollIndicators(.hidden)
        }
    }
    
    private var documentBody: some View{
        ZStack{
            Color.white
            
            ForEach(document.emojis){emoji in
                Text(emoji.string)
                    .font(.system(size: CGFloat(emoji.size)))
                    .position(CGPoint(x: emoji.position.x, y: emoji.position.y))
            }
        }
    }
}





#Preview{
    EmojiArtDocumentView(document: EmojiArtDocument())
}
