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
            documentContent(in: geometry)
            
            ZStack{
                Color.white
                
            }
            .dropDestination(for: Sturldata.self){sturldata, location in
                return drop(sturldata, at: location, in: geometry)
            }
        }
    }
    
    @ViewBuilder
    private func documentContent(in geometry: GeometryProxy)-> some View{
        
        AsyncImage(url: document.background)
            .position(Emoji.Position(x:0,y:0).in(geometry))
        ForEach(document.emojis){emoji in
            Text(emoji.string)
                .font(.system(size: CGFloat(emoji.size)))
                .position(emoji.position.in(geometry))
        }
    }
    
    private func drop(_ sturldatas: [Sturldata], at location: CGPoint, in geometry: GeometryProxy) -> Bool {

        for url in sturldatas {
            switch url {
            case .url(let url):
                document.setBackground(url)
               
            case .string(let emoji):
                document.addEmoji(emoji, at: emojiPosition(at: location, in: geometry), size: PaletteEmojiSize)
                return true
            default:
                break
            }
        }
        return false
    }
    
    private func emojiPosition(at location: CGPoint, in geometry: GeometryProxy)-> Emoji.Position{
        let center = geometry.frame(in: .local).center
        return Emoji.Position(
            x: Int(location.x - center.x),
            y: Int(-(location.y - center.y))
            )
    }
}





#Preview{
    EmojiArtDocumentView(document: EmojiArtDocument())
}
