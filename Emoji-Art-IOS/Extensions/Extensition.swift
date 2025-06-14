//
//  Extensition.swift
//  Emoji-Art-IOS
//
//  Created by jatin foujdar on 14/06/25.
//
import Foundation
import SwiftUI


struct ScrollingEmojis: View{
    let emojis: [String]
    
    init(emojis: String) {
        self.emojis = emojis.uniqued.map(String.init)
    }

  
    
    var body: some View{
        ScrollView(.horizontal){
            HStack{
                ForEach(emojis, id: \.self){emoji in
                    Text(emoji)
                }
            }
        }
    }
}

extension String {
    var uniqued: String {
       reduce(into: "") {sofar , element in
           if !sofar.contains(element){
               sofar.append(element)
           }
       }
    }
}
