//
//  PowerUsesData.swift
//  ToolTipLIb
//
//  Created by Moksh on 19/07/25.
//

import Foundation

class PowerUsesData : Identifiable {
    var id = UUID()
    var percentages: Double
    
    init(percentages: Double) {
        self.percentages = percentages
    }
}


