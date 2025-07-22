//
//  TooltipDataModel.swift
//  ToolTipLIb
//
//  Created by Moksh on 19/07/25.
//

import Foundation
import UIKit
import SwiftUI
import SwiftyUIX

public class TooltipDataModel: Identifiable {
    public var id: UUID
    var title: String?
    var message: String?
    var position: CGRect
    var cornerRadius: CGFloat
    var order: Int
    var contentAllignment: Alignment = .center
    var contantSpace: CGFloat = 0
    var contentWraperRect: (CGRect,Alignment) {
        var deviceOrientation = UIDevice.current.orientation
        deviceOrientation = deviceOrientation == .unknown ? .portrait : deviceOrientation
        let deviceHeight = deviceOrientation == .portrait ? UIScreen.main.bounds.height : UIScreen.main.bounds.width
        let deviceWidth = deviceOrientation == .portrait ? UIScreen.main.bounds.width : UIScreen.main.bounds.height
        let bottomSpace = UIScreen.main.bounds.height - position.maxY
        let topSpace = position.minY
        
        if bottomSpace < 100 && topSpace < 100 {
            return (.init(x: position.midX, y:  position.midY, width: deviceWidth, height: deviceHeight),.center)
        } else if bottomSpace > topSpace {
            self.contentAllignment = .top
            return (.init(x: deviceWidth/2, y: position.maxY + contantSpace + bottomSpace/2, width: deviceWidth, height: deviceHeight - position.maxY - contantSpace),.top)
            
        } else if topSpace > bottomSpace {
            self.contentAllignment = .bottom
            return (.init(x: deviceWidth/2, y:  (position.minY - contantSpace)/2, width: deviceWidth, height: position.minY - contantSpace),.bottom)
        }
        
        return (.init(x: position.midX, y:  position.midY, width: deviceWidth, height: deviceHeight),.center)
    }
    
    init(id: UUID, title: String?,message : String?, position: CGRect, CornerRadius: CGFloat = 8, order: Int = 0) {
        self.id = id
        self.title = title
        self.message = message
        self.position = position
        self.cornerRadius = CornerRadius
        self.order = order
        let deviceOrientation = UIDevice.current.orientation
        let deviceWidth = deviceOrientation == .portrait ? UIScreen.main.bounds.width : UIScreen.main.bounds.height
    }
  
}
