//
//  Data.swift
//  Xylophone
//
//  Created by Leonid on 26.01.2021.
//

import SwiftUI

struct XylophoneItem: Identifiable {
    var id = UUID()
    var title: String
    var color: Color
}

let xylphonesData = [
    XylophoneItem(title: "A", color: Color(red: 237/255, green: 112/255, blue: 107/255)),
    XylophoneItem(title: "B", color: Color(red: 245/255, green: 192/255, blue: 103/255)),
    XylophoneItem(title: "C", color: Color(red: 255/255, green: 255/255, blue: 127/255)),
    XylophoneItem(title: "D", color: Color(red: 172/255, green: 224/255, blue: 102/255)),
    XylophoneItem(title: "E", color: Color(red: 151/255, green: 204/255, blue: 246/255)),
    XylophoneItem(title: "F", color: Color(red: 193/255, green: 116/255, blue: 146/255))
]
