//
//  EmojiArtDocumentView.swift
//  Emoji-Art-IOS
//
//  Created by jatin foujdar on 14/06/25.
//

import SwiftUI


struct EmojiArtDocumentView: View {
    typealias Emoji = EmojiArtModel.Emoji
    private let PaletteEmojiSize: CGFloat = 40
    @ObservedObject  var document : EmojiArtDocument
    
    private let emojis = "👻🍎😃🤪☹️🤯🐶🐭🦁🐵🦆🐝🐢🐄🐖🌲🌴🌵🍄🌞🌎🔥🌈🌧️🌨️☁️⛄️⛳️🚗🚙🚓🚲🛺🏍️🚘✈️🛩️🚀🚁🏰🏠❤️💤⛵️"
    var body: some View{
        VStack(spacing: 0){
            documentBody
//            Color.yellow
            PaletteChooser()
                .font(.system(size: PaletteEmojiSize))
                .padding(.horizontal)
                .scrollIndicators(.hidden)
        }
    }
    
    private var documentBody: some View{
        GeometryReader{ geometry in
            ZStack{
                Color.white
                documentContent(in: geometry)
                    .scaleEffect(zoom * gestureZoom)
                    .offset(pan + gesturePan)
                
            }
            .gesture(panGesture.simultaneously(with: zoomGesture))
            .dropDestination(for: Sturldata.self){sturldata, location in
                return drop(sturldata, at: location, in: geometry)
            }
        }
    }
    
    
    
    
    @State private var zoom: CGFloat = 1
    @State private var pan : CGOffset = .zero
    @GestureState private var gestureZoom : CGFloat = 1
    @GestureState private var gesturePan : CGOffset = .zero
    
    private var zoomGesture: some Gesture {
        MagnificationGesture()
            .updating($gestureZoom){inMotionPinchScale, gestureZoom, _ in
                gestureZoom = inMotionPinchScale
            }
            .onEnded{ endingPinchScale in
            zoom *= endingPinchScale
            }
    }
    
    
    private var panGesture: some Gesture {
        DragGesture()
            .updating($gesturePan){value , gesturePan, _ in
                gesturePan = value.translation
            }
            .onEnded{value in
                pan += value.translation
            }
    }
    
    @ViewBuilder
    private func documentContent(in geometry: GeometryProxy)-> some View{
        
        AsyncImage(url: document.background)
            .position(Emoji.Position(x:0,y:0).in(geometry))
        ForEach(document.emojis){emoji in
            Text(emoji.string)
                .font(.system(size: CGFloat(emoji.size)))
                .position(emoji.position.in(geometry))
        }
    }
    
    private func drop(_ sturldatas: [Sturldata], at location: CGPoint, in geometry: GeometryProxy) -> Bool {

        for url in sturldatas {
            switch url {
            case .url(let url):
                document.setBackground(url)
               
            case .string(let emoji):
                document.addEmoji(emoji, at: emojiPosition(at: location, in: geometry), size: PaletteEmojiSize / zoom)
                
                return true
            default:
                break
            }
        }
        return false
    }
    
    private func emojiPosition(at location: CGPoint, in geometry: GeometryProxy)-> Emoji.Position{
        let center = geometry.frame(in: .local).center
        return Emoji.Position(
            x: Int((location.x - center.x - pan.width) / zoom),
            y: Int(-(location.y - center.y - pan.height) / zoom)
            )
    }
}





#Preview{
    EmojiArtDocumentView(document: EmojiArtDocument())
        .environmentObject(PaletteStore(named: "Preview"))
}
