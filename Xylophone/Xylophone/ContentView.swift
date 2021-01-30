//
//  ContentView.swift
//  Xylophone
//
//  Created by Leonid on 26.01.2021.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    let items = xylphonesItems
    @State private var soundPlayer: AVAudioPlayer?
    
    @Environment(\.verticalSizeClass) var sizeClass: UserInterfaceSizeClass?

    
    var body: some View {
        if sizeClass == .compact {
            HStack(spacing: 0) {
                ForEach(items) {item in
                    Button(action: {
                        playSound(sound: item.title)
                    }) {
                        item.color
                            .edgesIgnoringSafeArea(.all)
                    }
                    
                }
            }
        } else {
            VStack(spacing: 10) {
                ForEach(items.indices) { item in
                    GeometryReader { geo in
                        Button(action: {
                            playSound(sound: items[item].title)
//                            print(items[0])
                        }) {
                            items[item].color
                                .cornerRadius(14)
                                .frame(width: geo.size.width - CGFloat(item + 1) * 10, height: geo.size.height)
                                .position(x: geo.size.width / 2, y: geo.size.height / 2)
                                
//                                Text("\(geo.size.height) and \(item + 1)")
                            
                        }
                    }
                }
            }
//                                .edgesIgnoringSafeArea(.all)
        }
        
    }
    
    func playSound(sound: String) {
        let path = Bundle.main.path(forResource: sound, ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            soundPlayer?.play()
        } catch {
            print("error")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                
        }
    }
}
