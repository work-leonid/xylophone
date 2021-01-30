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
                        Text("d")
//                        item.color
//                            .edgesIgnoringSafeArea(.all)
                    }
                    .buttonStyle(ButtonWithShadowView(bgColor: item.color))
                }
            }
        } else {
            VStack(spacing: 0) {
                ForEach(items) {item in
                    Button(action: {
//                        playSound(sound: item.title)
                    }) {
                        Rectangle()
                            .fill(Color.clear)
//                        item.color
//                            .edgesIgnoringSafeArea(.all)
                    }
                    .buttonStyle(ButtonWithShadowView(bgColor: item.color))
                }
            }
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
        ContentView()
    }
}
