//
//  EmojiArtDocumentView.swift
//  Emoji-Art-IOS
//
//  Created by jatin foujdar on 14/06/25.
//

import SwiftUI


struct EmojiArtDocumentView: View {
    private let PaletteEmojiSize: CGFloat = 40
    private let emojis = "👻🍎😃🤪☹️🤯🐶🐭🦁🐵🦆🐝🐢🐄🐖🌲🌴🌵🍄🌞🌎🔥🌈🌧️🌨️☁️⛄️⛳️🚗🚙🚓🚲🛺🏍️🚘✈️🛩️🚀🚁🏰🏠❤️💤⛵️"
    var body: some View{
        VStack(spacing: 0){
            Color.yellow
            ScrollingEmojis(emojis)
                .font(.system(size: PaletteEmojiSize))
                .padding(.horizontal)
                .scrollIndicators(.hidden)
        }
    }
}





#Preview{
    EmojiArtDocumentView()
}
