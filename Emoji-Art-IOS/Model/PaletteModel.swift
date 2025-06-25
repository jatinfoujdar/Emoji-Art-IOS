//
//  Palette.swift
//  Emoji-Art-IOS
//
//  Created by jatin foujdar on 25/06/25.
//

import Foundation


struct PaletteModel: Identifiable {
    var name: String
    var emoji: String
    let id = UUID()
    
    static let builtins: [PaletteModel] = [
        PaletteModel(name: "Animals", emoji: "🐶🐱🦁🐯🐵🐸🐰🦊🐻🐼"),
        PaletteModel(name: "Sports", emoji: "⚽️🏀🏈⚾️🎾🏐🏉🥊🥋⛳️"),
        PaletteModel(name: "Vehicles", emoji: "🚗🚕🚙🚌🚎🏎️🚓🚑🚒🚐"),
        PaletteModel(name: "Music", emoji: "🎵🎶🎤🎧🎷🎸🎹🥁📯🎼"),
        PaletteModel(name: "Flora", emoji: "🌸🌼🌻🌺🌷🌹🌱🌿🍀🍃"),
        PaletteModel(name: "Weather", emoji: "☀️🌤⛅️🌥☁️🌦🌧⛈🌩🌨")
    ]
}

