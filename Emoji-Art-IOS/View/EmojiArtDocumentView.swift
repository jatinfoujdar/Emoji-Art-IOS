//
//  EmojiArtDocumentView.swift
//  Emoji-Art-IOS
//
//  Created by jatin foujdar on 14/06/25.
//

import SwiftUI


struct EmojiArtDocumentView: View {
    typealias Emoji = EmojiArtModel.Emoji
    private let PaletteEmojiSize: CGFloat = 40
    @ObservedObject  var document : EmojiArtDocument
    
    private let emojis = "👻🍎😃🤪☹️🤯🐶🐭🦁🐵🦆🐝🐢🐄🐖🌲🌴🌵🍄🌞🌎🔥🌈🌧️🌨️☁️⛄️⛳️🚗🚙🚓🚲🛺🏍️🚘✈️🛩️🚀🚁🏰🏠❤️💤⛵️"
    var body: some View{
        VStack(spacing: 0){
            documentBody
//            Color.yellow
            ScrollingEmojis(emojis)
                .font(.system(size: PaletteEmojiSize))
                .padding(.horizontal)
                .scrollIndicators(.hidden)
        }
    }
    
    private var documentBody: some View{
        GeometryReader{ geometry in
            
            
            ZStack{
                Color.white
                AsyncImage(url: document.background)
                    .position(Emoji.Position(x:0,y:0).in(geometry))
                ForEach(document.emojis){emoji in
                    Text(emoji.string)
                        .font(.system(size: CGFloat(emoji.size)))
                        .position(emoji.position.in(geometry))
                }
            }
        }
    }
}





#Preview{
    EmojiArtDocumentView(document: EmojiArtDocument())
}
