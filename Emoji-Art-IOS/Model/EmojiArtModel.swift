//
//  EmojiArtModel.swift
//  Emoji-Art-IOS
//
//  Created by jatin foujdar on 14/06/25.
//

import Foundation

struct EmojiArtModel{
    var background: URL? = nil
    var emojis = [Emoji]()
    
    struct Emoji{
        let string: String
        var position: Position
        var size: Int
        
        
        struct Position{
            var x: Int
            var y: Int
        }
        
        
    }
    
}
