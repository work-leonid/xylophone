//
//  ContentView.swift
//  Xylophone
//
//  Created by Leonid on 26.01.2021.
//

import SwiftUI

struct ContentView: View {
    let items = xylphonesData
    
    var body: some View {
        VStack {
        ForEach(items) {item in
                Text(item.title)
                    .foregroundColor(item.color)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
