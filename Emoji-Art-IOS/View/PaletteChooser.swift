//
//  PaletteChooser.swift
//  Emoji-Art-IOS
//
//  Created by jatin foujdar on 25/06/25.
//

import SwiftUI

struct PaletteChooser: View {
    @EnvironmentObject var store: PaletteStore
    
    var body: some View {
        HStack{
            chooser
            view(for: store.palettes[store.cursorIndex])
        }
    }
    var chooser: some View {
        Button{
            store.cursorIndex += 1
        }label: {
            Image(systemName: "paintpalette")
        }
    }
    func view(for palette: PaletteModel) -> some View {
        HStack{
            Text(palette.name)
            ScrollingEmojis(palette.emoji)
        }
    }
}

#Preview {
    PaletteChooser()
        .environmentObject(PaletteStore(named: "Preview"))
}
