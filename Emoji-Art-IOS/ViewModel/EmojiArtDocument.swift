//
//  EmojiArtDocument.swift
//  Emoji-Art-IOS
//
//  Created by jatin foujdar on 14/06/25.
//

import Foundation


class EmojiArtDocument: ObservableObject{
    typealias Emoji = EmojiArtModel.Emoji
    
    private var emojisArt = EmojiArtModel()
    
    var emojis: [Emoji]{
        emojisArt.emojis
    }
    
    var background: URL? {
        emojisArt.background
    }
    
    func setBackground(_ url: URL?){
        emojisArt.background = url
    }
    
    
    
}
