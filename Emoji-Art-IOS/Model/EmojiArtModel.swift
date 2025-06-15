//
//  EmojiArtModel.swift
//  Emoji-Art-IOS
//
//  Created by jatin foujdar on 14/06/25.
//

import Foundation

struct EmojiArtModel{
    var background: URL? = nil
   private(set) var emojis = [Emoji]()
    
    
    private var uniqueEmojiId = 0
    
    
    mutating func addEmoji(_ emoji: String, at position: Emoji.Position, size: Int){
        uniqueEmojiId += 1
        emojis.append(Emoji(id: UUID(), string: emoji, position: position, size: size))
    }
    
    struct Emoji: Identifiable {
        let id: UUID
        let string: String
        var position: Position
        var size: Int
        
        
        struct Position{
            var x: Int
            var y: Int
        }
        
        
    }
    
}
