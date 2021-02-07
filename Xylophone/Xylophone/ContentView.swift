//
//  SwiftUIView.swift
//  Xylophone
//
//  Created by Leonid on 30.01.2021.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    let keys = xylphonesItems
    
    @State private var soundPlayer: AVAudioPlayer?
    @State private var isFullScreen = true
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: isFullScreen ? 0 : 15) {
                ForEach(keys.indices) { index in
                    GeometryReader { geo in
                        Button(action: {
                            playSound(byName: keys[index].title)
                        }) {
                            keys[index].color
                                .cornerRadius(isFullScreen ? 0 : 15)
                                .frame(
                                    width: isFullScreen ? geo.size.width : geo.size.width - CGFloat(index + 1) * 14,
                                       height: geo.size.height)
                                .position(x: geo.size.width / 2, y: geo.size.height / 2)
                                .animation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0.4))
                        }
                    }
                }
            }
            .padding(isFullScreen ? 0 : 10)
            .edgesIgnoringSafeArea(isFullScreen ? .all : .horizontal)
            
            Button(action: {
                isFullScreen.toggle()
            }) {
                Image(systemName: isFullScreen ? "arrow.up.backward.and.arrow.down.forward.circle.fill" : "arrow.down.right.and.arrow.up.left.circle.fill")
                    .font(.largeTitle)
                    .background(Color.white)
                    .foregroundColor(Color.pink)
                    .clipShape(Circle())
                    .padding()
                    .animation(.spring())
                    
            }
        }
        
    }
    
    func playSound(byName: String) {
        let path = Bundle.main.path(forResource: byName, ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            soundPlayer?.play()
        } catch {
            print("error")
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .previewDevice(PreviewDevice(rawValue: "iPad Pro (10.5-inch)"))
    }
}
