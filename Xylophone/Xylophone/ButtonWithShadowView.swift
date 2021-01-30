//
//  ButtonWithShadowView.swift
//  Xylophone
//
//  Created by Leonid on 30.01.2021.
//

import SwiftUI

struct ButtonWithShadowView: ButtonStyle {
    var bgColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                Group {
                    if configuration.isPressed {
                        Rectangle()
                            .fill(bgColor)
                            .colorMultiply(bgColor)
//                            .blendMode(.multiply)
                            .overlay(
                                Rectangle()
                                    .frame(width: nil, height: 10, alignment: .top)
                                    .foregroundColor(bgColor), alignment: .top)
                            .blendMode(.multiply)
                        
                        
                    } else {
                        Rectangle()
                            .fill(bgColor)
                    }
                }
            )
    }
}

struct ButtonWithShadowView1: View {
    var body: some View {
        Button(action: {}) {
            Rectangle()
                .fill(Color.clear)
                .padding()
        }
        .buttonStyle(ButtonWithShadowView(bgColor: Color.yellow))
    }
}

struct ButtonWithShadowView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonWithShadowView1()
    }
}
