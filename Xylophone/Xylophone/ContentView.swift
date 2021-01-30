//
//  ContentView.swift
//  Xylophone
//
//  Created by Leonid on 26.01.2021.
//

import SwiftUI

struct ContentView: View {
    let items = xylphonesItems
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(items) {item in
                Button(action: {
                    print(item.title)
                }) {
                    item.color
                        .edgesIgnoringSafeArea(.all)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
