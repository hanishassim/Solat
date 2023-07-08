//
//  Color+Extensions.swift
//  Solat
//
//  Created by Hanis on 09/07/2023.
//

import SwiftUI

extension Color {
    static let defaultBackground = Color(light: .white, dark: .black)
    
    init(light lightModeColor: @escaping @autoclosure () -> Color,
         dark darkModeColor: @escaping @autoclosure () -> Color) {
        self.init(UIColor(light: UIColor(lightModeColor()),
                          dark: UIColor(darkModeColor())))
    }
}
