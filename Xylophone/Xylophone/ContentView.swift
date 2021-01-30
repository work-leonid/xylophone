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
    @State private var fullScreen = false
    
    @Environment(\.verticalSizeClass) var sizeClass: UserInterfaceSizeClass?

    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
            ZStack {
                if fullScreen {
                    FullScreenViewAnimation()
                        .transition(.moveAndFade)
                } else {
                    NotFullScreenViewAnimation()
                        .transition(.moveAndFade)
                }
            }
            .animation(.spring())
            
            
            
            Button(action: {
                withAnimation {
                    self.fullScreen.toggle()
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .background(Color.blue.clipShape(Circle()))
                    .shadow(radius: fullScreen ? 10 : 0)
                    .padding()
                    .rotationEffect(Angle(degrees: fullScreen ? 360 : 0))
                    .scaleEffect(fullScreen ? 1.3 : 1)
                    .animation(.spring())
                    
            }
        }
        
    }
    
//    private var fullScreenView: some View {
//        VStack(spacing: 10) {
//            ForEach(items.indices) { item in
//                GeometryReader { geo in
//                    Button(action: {
//                        playSound(sound: items[item].title)
//                    }) {
//                        items[item].color
//                            .cornerRadius(14)
//                            .frame(width: geo.size.width - CGFloat(item + 1) * 10, height: geo.size.height)
//                            .position(x: geo.size.width / 2, y: geo.size.height / 2)
//                    }
//                }
//            }
//        }
//    }
    
//    private var separateButtonsView: some View {
//        VStack(spacing: 0) {
//            ForEach(items.indices) { item in
//                    Button(action: {
//                        playSound(sound: items[item].title, player: player)
//                    }) {
//                        items[item].color
//                }
//            }
//        }
//        .edgesIgnoringSafeArea(.all)
//    }
}

//func playSound(sound: String, player: AVAudioPlayer) {
//    let path = Bundle.main.path(forResource: sound, ofType: "wav")!
//    let url = URL(fileURLWithPath: path)
//
//    do {
//        player = try AVAudioPlayer(contentsOf: url)
//        player?.play()
//    } catch {
//        print("error")
//    }
//}

struct FullScreenViewAnimation: View {
    let items = xylphonesItems
//    @State private var viewPlayer = AVAudioPlayer?
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(items.indices) { item in
                GeometryReader { geo in
                    Button(action: {
//                        playSound(sound: items[item].title)
                    }) {
                        items[item].color
                            .cornerRadius(14)
                            .frame(width: geo.size.width - CGFloat(item + 1) * 10, height: geo.size.height)
                            .position(x: geo.size.width / 2, y: geo.size.height / 2)
//                            .transition(.move(edge: .trailing))
                            .animation(.ripple(index: item))
                    }
                }
            }
        }
    }
}

struct NotFullScreenViewAnimation: View {
    let items = xylphonesItems
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(items.indices) { item in
                    Button(action: {
//                        playSound(sound: items[item].title)
                    }) {
                        items[item].color
//                            .transition(.move(edge: .trailing))
                            .animation(.ripple(index: item))
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}


extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.2)
            .speed(2)
            .delay(0.03 * Double(index))
    }

}

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                
        }
    }
}
