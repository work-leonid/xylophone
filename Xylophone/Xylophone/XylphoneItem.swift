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
    XylophoneItem(title: "A", color: Color.red),
    XylophoneItem(title: "B", color: Color.blue),
]
