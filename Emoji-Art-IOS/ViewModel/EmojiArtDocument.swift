//
//  EmojiArtDocument.swift
//  Emoji-Art-IOS
//
//  Created by jatin foujdar on 14/06/25.
//

import Foundation
import SwiftUI


class EmojiArtDocument: ObservableObject{
    typealias Emoji = EmojiArtModel.Emoji
    
    private var emojisArt = EmojiArtModel()
    
    init(){
        emojisArt.addEmoji("😀", at: .init(x: -200, y: -150), size: 200)
        emojisArt.addEmoji("🐶", at: .init(x: 250, y: 100), size: 200)

    }
    
    
    var emojis: [Emoji]{
        emojisArt.emojis
    }
    
    var background: URL? {
        emojisArt.background
    }
    
    func setBackground(_ url: URL?){
        emojisArt.background = url
    }
    
    
    func addEmoji(_ emoji: String, at position: Emoji.Position, size: CGFloat){
        emojisArt.addEmoji(emoji, at: position, size: Int(size))
    }
}

extension EmojiArtModel.Emoji.Position{
    func `in`(_ geometry: GeometryProxy)-> CGPoint{
        let center = geometry.frame(in: .local).center
        return CGPoint(x: center.x + CGFloat(x), y: center.y - CGFloat(y))
    }
}
