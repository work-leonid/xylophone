//
//  ShadowView.swift
//  Xylophone
//
//  Created by Leonid on 30.01.2021.
//

import SwiftUI

struct ButtonWithInnerShadow: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(50)
            .background(
                Group {
                    if configuration.isPressed {
                        Rectangle()
                            .fill(Color.orange)
                                .overlay(
                                    Rectangle().frame(width: nil, height: 10, alignment: .top).foregroundColor(Color.red), alignment: .top)

//                            )
                            
                    } else {
                        Rectangle()
                            .fill(Color.yellow)
                }
            }
        )
    }
}

struct ShadowView: View {
    @State private var isTapped = false
    var body: some View {
        VStack(spacing: 0) {
            Button(action: {
                isTapped.toggle()
            }) {
                Text("Hey")
            }
            .buttonStyle(ButtonWithInnerShadow())
            
            Button(action: {
                isTapped.toggle()
            }) {
                Text("Hey")
            }
            .buttonStyle(ButtonWithInnerShadow())
        }
        
    }
}

struct ShadowView_Previews: PreviewProvider {
    static var previews: some View {
        ShadowView()
    }
}
