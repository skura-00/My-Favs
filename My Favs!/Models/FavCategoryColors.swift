//
//  FavCategoryColors.swift
//  My Favs!
//
//  Created by Sachi Kurata on 2023/06/11.
//

import SwiftUI

// referenced Playgrounds <Date Planner> App/ColorOption.swift
struct FavCategoryColors: Codable {
    static var all: [Color] = [
        .primary,
        .red,
        .orange,
        .yellow,
        .green,
        .mint,
        .blue,
        .purple,
        .brown,
        .black,
    ]
    
    static var `default` : Color = Color.primary
    
    
    static func getColor() -> Color {
        return .accentColor
    }
    
}

struct RGBAColor: Codable, Hashable {
    var r: CGFloat
    var g: CGFloat
    var b: CGFloat
    var a: CGFloat
}

extension Color {
    var r: CGFloat { UIColor(self).colorComponents.red }
    var g: CGFloat { UIColor(self).colorComponents.green }
    var b: CGFloat { UIColor(self).colorComponents.blue }
    var a: CGFloat { UIColor(self).colorComponents.alpha }
    
    var rgbaColor: RGBAColor {
        RGBAColor(r: self.r, g: self.g, b: self.b, a: self.a)
    }
    
    init(_ rgbaColor: RGBAColor) {
        self.init(red: rgbaColor.r, green: rgbaColor.g, blue: rgbaColor.b, opacity: rgbaColor.a)
    }
}

extension UIColor {
    var colorComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)

        return (r, g, b, a)
    }
}
