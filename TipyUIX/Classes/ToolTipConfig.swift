//
//  ToolTipConfig.swift
//  ToolTipLIb
//
//  Created by John kim on 7/22/25.
//

import SwiftUI
import UIKit
import SwiftyUIX

public enum BackgroudStyle {
    case clear
    case Color(color: Color)
    case blurView(style: UIBlurEffect.Style)
    case LinearGradient(style: LinearGradient)
    
    static func ==(lhs: BackgroudStyle, rhs: BackgroudStyle) -> Bool {
            switch (lhs, rhs) {
            case (.clear, .clear):
                return true
            case (.Color(let color1), .Color(let color2)):
                return color1 == color2
            case (.blurView(let style1), .blurView(let style2)):
                return style1 == style2
            case (.LinearGradient(let style1), .LinearGradient(let style2)):
                return false
            default:
                return false
            }
        }
}

public class ToolTipConfig {
    public var backgroundStyle: BackgroudStyle = .blurView(style: .systemUltraThinMaterial)
    public var maskBorderColor: Color = Color.black
    public var maskBorderWidth: CGFloat = 2
    public var titleFont: Font = .headline
    public var messageFont: Font = .subheadline
    public var titleColor: Color = Color.tooltip_title
    public var messageColor: Color = Color.tooltip_message
    
    public var isHapticFeedbackEnabled: Bool = true
    
    public var popupViewCornerRadius: CGFloat = 16
    public var popupViewShadowRadius: CGFloat = 3
    public var popupviewShadowOpacity: CGFloat = 0.15
    public var popupviewShadowOffset: CGPoint = CGPoint(x: 0, y: 2)
    public var popupViewBackround: BackgroudStyle = .Color(color: Color.tooltip_popup_background) {
        didSet {
            // Automatically update the padding based on the background style
            _popupViewAnchorPadding = popupViewBackround == .clear ? 0 : 10
            _popupViewAnchorShow =  popupViewBackround == .clear ? false : true
        }
    }
    
    // Private backing property for popupViewAnchorPadding
    private var _popupViewAnchorPadding: CGFloat = 10
    
    // Read-only computed property to get the popupViewAnchorPadding
    public var popupViewAnchorPadding: CGFloat {
        return _popupViewAnchorPadding
    }
    
    private var _popupViewAnchorShow: Bool = true
    
    // Read-only computed property to get the popupViewAnchorPadding
    public var popupViewAnchorShow: Bool {
        return _popupViewAnchorShow
    }
    
    public init(){
        _popupViewAnchorPadding = popupViewBackround == .clear ? 0 : 10
        _popupViewAnchorShow =  popupViewBackround == .clear ? false : true
    }
}

extension Color {
    static public var tooltip_title : Color {
        Color("toolTip_title")
    }
    
    static public var tooltip_message : Color {
        Color("toolTip_message")
    }
    
    static public var tooltip_popup_background : Color {
        Color("popupViewColor")
    }
}
