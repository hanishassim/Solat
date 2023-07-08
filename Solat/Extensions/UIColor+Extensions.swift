//
//  UIColor+Extensions.swift
//  Solat
//
//  Created by Hanis on 09/07/2023.
//

#if os(OSX)
import Cocoa
#elseif os(iOS)
import UIKit
#endif

#if os(OSX)
extension NSColor {
    convenience init(light: NSColor, dark: NSColor) {
        self.init.init { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .light, .unspecified:
                return light
            case .dark:
                return dark
            @unknown default:
                return light
            }
        }
    }
}
#elseif os(iOS)
extension UIColor {
    convenience init(light lightModeColor: @escaping @autoclosure () -> UIColor,
                     dark darkModeColor: @escaping @autoclosure () -> UIColor) {
        self.init { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .light, .unspecified:
                return lightModeColor()
            case .dark:
                return darkModeColor()
            @unknown default:
                return lightModeColor()
            }
        }
    }
}
#endif
