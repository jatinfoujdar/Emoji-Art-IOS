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
    @Published private var _cursorIndex = 0
    
    var cursorIndex: Int{
        get{boundsCheckedPaletteIndex(_cursorIndex)}
        set{_cursorIndex = boundsCheckedPaletteIndex(newValue)}
    }
    
    
    private func boundsCheckedPaletteIndex(_ index: Int) -> Int {
        var index = index % palettes.count
        if index < 0 {
            index += palettes.count
        }
        return index
    }
}


