//
//  Emoji_Art_IOSApp.swift
//  Emoji-Art-IOS
//
//  Created by jatin foujdar on 14/06/25.
//

import SwiftUI

@main
struct Emoji_Art_IOSApp: App {
    @StateObject var defaultDocument = EmojiArtDocument()
    @StateObject var paletteStore = PaletteStore(named: "Main")
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: defaultDocument)
                .environmentObject(paletteStore)
//            ContentView()
        }
    }
}
