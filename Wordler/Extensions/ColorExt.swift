//
//  ColorExt.swift
//  Wordler
//
//  Created by danilka on 06.07.2023.
//

import Foundation
import SwiftUI

extension Color {
    static let main = Color("main")
    static let lightGray = Color("lightGray")
    static let iconGray = Color("iconGray")
    static let stroke = Color("stroke")
    static let textGray = Color("textGray")
    
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
