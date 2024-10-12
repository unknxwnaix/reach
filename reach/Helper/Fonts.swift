//
//  Fonts.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 30-09-2024.
//

import SwiftUI

extension Font {
    enum CustomSize {
        case small, medium, large, extraLarge, huge
        
        var size: CGFloat {
            switch self {
            case .small:
                return 14
            case .medium:
                return 18
            case .large:
                return 24
            case .extraLarge:
                return 32
            case .huge:
                return 40
            }
        }
    }
    
    static func customRoundedFont(_ size: CustomSize) -> Font {
        return .system(size: size.size, weight: .regular, design: .rounded)
    }
    
    static func customBoldRoundedFont(_ size: CustomSize) -> Font {
        return .system(size: size.size, weight: .bold, design: .rounded)
    }
}
