//
//  SwiftUIExtension.swift
//  SalahUtility
//
//  Created by Salah on 6/8/22.
//  Copyright © 2022 Salah. All rights reserved.
//
#if os(iOS)

import Foundation
import SwiftUI
import UIKit

@available(iOS 13.0, *)
extension Color {
    public  init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
@available(iOS 13.0, *)
public extension View {
     func bs_addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
        let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
        return clipShape(roundedRect)
             .overlay(roundedRect.strokeBorder(content, lineWidth: width))
    }
     func bs_cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
    func bs_cutomTint(_ color:Color?) -> some View{
        if #available(iOS 16.0, *) {
            return self.tint(color)
        } else {
            return self.foregroundColor(color)
        }
    }
    @ViewBuilder func bs_isHidden(_ value: Binding<Bool>) -> some View {
        value.wrappedValue ? self.hidden() as? Self : self
    }
    @ViewBuilder func bs_isHidden(_ value:Bool) -> some View {
        value ? self.hidden() as? Self : self
    }
}

@available(iOS 13.0, *)
public struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    struct CornerRadiusShape: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    public func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}
#endif
@available(iOS 13.0, *)
public extension View {
    func bs_dismissKeyboardOnTap() -> some View {
        modifier(DismissKeyboardOnTap())
    }
}
@available(iOS 13.0, *)
public struct DismissKeyboardOnTap: ViewModifier {
    public func body(content: Content) -> some View {
        #if os(macOS)
        return content
        #else
        return content.gesture(tapGesture)
        #endif
    }
    private var tapGesture: some Gesture {
        TapGesture().onEnded({
            UIApplication.shared.bs_windowForegroundActive?.endEditing(true)
        })
    }
}
