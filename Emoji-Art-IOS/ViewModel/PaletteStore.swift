//
//  PaletteStore.swift
//  Emoji-Art-IOS
//
//  Created by jatin foujdar on 25/06/25.
//

import SwiftUI


class PaletteStore : ObservableObject {
    
    let name: String
    @Published var palettes: [PaletteModel]{
        didSet{
            if palettes.isEmpty , !oldValue.isEmpty {
                palettes = oldValue
            }
        }
    }
    
    
    init(named name: String){
        self.name = name
        palettes = PaletteModel.builtins
        if palettes.isEmpty {
            palettes = [PaletteModel(name: "Warning", emoji: "⚠️")]
        }
    }
}


