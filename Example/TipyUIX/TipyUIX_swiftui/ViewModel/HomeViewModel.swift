//
//  HomeViewModel.swift
//  ToolTipLIb
//
//  Created by Moksh on 19/07/25.
//

import SwiftUI
import SwiftyUIX
import TipyUIX

class HomeViewModel : ObservableObject {
    let powerUsesDataArray: [PowerUsesData] = [
        PowerUsesData(percentages: 23.5),
        PowerUsesData(percentages: 85.7),
        PowerUsesData(percentages: 56.3),
        PowerUsesData(percentages: 12.9),
        PowerUsesData(percentages: 74.8),
        PowerUsesData(percentages: 91.2),
        PowerUsesData(percentages: 48.6),
        PowerUsesData(percentages: 37.4),
        PowerUsesData(percentages: 68.3),
        PowerUsesData(percentages: 5.6),
        PowerUsesData(percentages: 19.9),
        PowerUsesData(percentages: 42.1),
        PowerUsesData(percentages: 77.2),
        PowerUsesData(percentages: 33.8),
        PowerUsesData(percentages: 66.1),
        PowerUsesData(percentages: 29.4),
        PowerUsesData(percentages: 53.8),
        PowerUsesData(percentages: 80.5),
        PowerUsesData(percentages: 18.7),
        PowerUsesData(percentages: 61.0)
    ]
    
    @ObservedObject var toolTipManager: ToolTipManager = ToolTipManager.shared
    @Published var isToolTipVisible: Bool = false
    
    init() {
        toolTipManager.tooltipCloseHandlder = { [weak self] in
            self?.isToolTipVisible = false
        }
        
       
    }
    
    func didAppear() {
        Thread.runAfter(1) {
            self.showToolTip()
        }
    }
    var themeCounter: Int = 0
    var theme1 : ToolTipConfig {
        let config = ToolTipConfig()
        config.backgroundStyle = .Color(color: Color.black.opacity(0.7))
        config.maskBorderColor = .red
        config.popupViewBackround = .clear
        config.titleColor = Color.green
        config.messageColor = Color.white
        return config
    }
    
    var theme2 : ToolTipConfig {
        let config = ToolTipConfig()
        config.backgroundStyle = .LinearGradient(style: .linearGradient(colors: [Color.blue.opacity(0.6), Color.red.opacity(0.6)], startPoint: .top, endPoint: .bottom))
        config.maskBorderColor = .white
        config.maskBorderWidth = 4
        config.popupViewBackround = .blurView(style: .systemMaterial)
        config.titleFont = .body.smallCaps()
        config.messageFont = .caption
        config.titleColor = Color.black
        config.messageColor = Color.black.opacity(0.6)
        return config
    }
    
    var theme3 : ToolTipConfig {
        let config = ToolTipConfig()
        config.backgroundStyle = .blurView(style: .systemUltraThinMaterial)
        config.maskBorderColor = .clear
        config.maskBorderWidth = 0
        config.popupViewBackround = .clear
        config.titleColor = Color.white
        config.messageColor = Color.white.opacity(0.6)
        return config
    }
    
    var theme4 : ToolTipConfig {
        let config = ToolTipConfig()
        config.backgroundStyle = .blurView(style: .systemMaterialDark)
        config.maskBorderColor = Color.white.opacity(0.6)
        config.maskBorderWidth = 4
        config.popupViewBackround = .clear
        config.titleColor = Color.white
        config.messageColor = Color.white.opacity(0.6)
        return config
    }
    
    func changeTheme() {
        switch themeCounter {
        case 0:
            self.toolTipManager.config = theme1
            break
        case 1:
            self.toolTipManager.config = theme2
            break
        case 2:
            self.toolTipManager.config = theme3
            break
        case 3:
            self.toolTipManager.config = theme4
            break
        default:
            self.toolTipManager.config = ToolTipConfig()
            themeCounter = 0
            break
        }
        
        self.toolTipManager.currentIndex = 0
        self.showToolTip()
        self.themeCounter += 1
    }
    
}
