//
//  UIColorExtension.swift
//  Refs-app
//
//  Created by Екатерина Никифорова on 07.02.2024.
//

import SwiftUI

extension Color {
    public static var mainBlue: Color {
        return Color(UIColor(red: 5/255, green: 0/255, blue: 255/255, alpha: 1.0))
    }
    
    public static var black: Color {
        return Color(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0))
    }
    
    public static var white: Color {
        return Color(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0))
    }
    
    public static var lightGray: Color {
        return Color(UIColor(red: 228/255, green: 228/255, blue: 230/255, alpha: 1.0))
    }
    
    public static var darkBlue: Color {
        return Color(UIColor(red: 4/255, green: 0/255, blue: 184/255, alpha: 1.0))
    }
    
    public static var lightBlue: Color {
        return Color(UIColor(red: 189/255, green: 187/255, blue: 255/255, alpha: 1.0))
    }
}
