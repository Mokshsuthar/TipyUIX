//
//  ToolTipManager.swift
//  ToolTipLIb
//
//  Created by Moksh on 19/07/25.
//

import Foundation
import SwiftUI
import SwiftyUIX

public class ToolTipManager : ObservableObject {
    static public var shared = ToolTipManager()
    
    //view Properties
    public var tooltipCloseHandlder: (() -> Void)?
    public var currentIndex: Int = 0
    
    public var config: ToolTipConfig = ToolTipConfig()
    
    let screenHeight: CGFloat = UIScreen.main.bounds.height
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    @Published var maskSize : CGSize = .zero
    @Published var maskPosition : CGPoint = .zero {
        didSet{
            if self.config.isHapticFeedbackEnabled {
                self.playHapticFeedback(type: .light)
            }
        }
    }
    @Published var cornerRadius : CGFloat = .zero
    
    @Published var title: String?
    @Published var message: String?
//    @Published var contentPosition : CGPoint = .zero
    @Published var contentAllignment: Alignment = .center
    @Published var contentWraperRect: CGRect = .zero
    
    @Published var isPopUpViewShow: Bool = false
    
    
    
    
    
    var TipsArray: [TooltipDataModel] = []
    
    func addToolTip(_ tip: TooltipDataModel) {
        if TipsArray.contains(where: {$0.id == tip.id}) {
            return
        }
        TipsArray.append(tip)
        self.TipsArray = TipsArray.sorted { $0.order < $1.order }
    }
    
    func showAllToolTip() {
        if currentIndex < TipsArray.count {
            self.maskSize =  UIScreen.main.bounds.size
            self.maskPosition = .init(x: maskSize.width/2, y: maskSize.height/2)
            
            let tip = TipsArray[currentIndex]
            self.contentAllignment = tip.contentWraperRect.1
            self.contentWraperRect = tip.contentWraperRect.0
            withAnimation {
                self.isPopUpViewShow = true
                self.maskSize = .init(width: tip.position.width + 20, height: tip.position.height + 20)
                self.maskPosition = .init(x: tip.position.midX, y: tip.position.midY)
//                self.contentPosition = tip.contentPosition
                self.cornerRadius = tip.cornerRadius
                self.title =  tip.title
                self.message =  tip.message
                
            }
        }
    }
    
    func nextTip() {
        self.currentIndex += 1
        if currentIndex < TipsArray.count {
            let tip = TipsArray[currentIndex]
           withAnimation {
                self.maskPosition = .init(x: tip.position.midX, y: tip.position.midY)
                self.maskSize = .init(width: tip.position.width + 20, height: tip.position.height + 20)
                self.cornerRadius = tip.cornerRadius
               self.contentAllignment = tip.contentWraperRect.1
               self.contentWraperRect = tip.contentWraperRect.0
               self.title =  tip.title
               self.message =  tip.message
                
            }
        } else {
            withAnimation {
                self.isPopUpViewShow = false
                self.maskSize =  UIScreen.main.bounds.size
                self.maskPosition = .init(x: maskSize.width/2, y: maskSize.height/2)
            }
            if self.config.isHapticFeedbackEnabled {
                self.playHapticFeedback(type: .heavy)
            }
            Thread.runAfter(0.5) {
                if let topLevelViewController = UIApplication.topViewController() {
                    topLevelViewController.dismiss(animated: false, completion: {
                        self.tooltipCloseHandlder?()
                    })
                }else {
                    self.tooltipCloseHandlder?()
                }
            }
           
        }
    }
}


extension View {
    public func registerToolTip(id: UUID = UUID(),title: String? ,message: String?,cornerRadius: CGFloat = 8,order: Int = 0) -> some View {
        self.background {
            GeometryReader { reader in
                Rectangle()
                    .frame(width: 0, height: 0, alignment: .center)
                    .onAppear {
                        ToolTipManager.shared.addToolTip(.init(id: id,title: title, message: message, position: reader.frame(in: .global),CornerRadius: cornerRadius, order: order))
                    }
            }
        }
    }
}

extension ObservableObject {
    public func showToolTip(){
        if let topLevelViewController = UIApplication.topViewController() {
            let tooltipView = UIHostingController(rootView: ToolTipView())
            tooltipView.view.bounds = topLevelViewController.view.bounds
            tooltipView.view.backgroundColor = .clear
            tooltipView.modalPresentationStyle = .overFullScreen
            topLevelViewController.present(tooltipView, animated: false)
        }
    }
}
