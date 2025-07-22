//
//  ToolTipView.swift
//  ToolTipLIb
//
//  Created by Moksh on 19/07/25.
//

import SwiftUI
import SwiftyUIX

struct ToolTipView: View {
    @StateObject var viewModel: ToolTipManager = ToolTipManager.shared
    
    @Namespace var animation
    
    var body: some View {
        ZStack{
            ZStack{
                switch viewModel.config.backgroundStyle {
                case .clear:
                    Color.black.opacity(0.0001)
                        .fullFrame()
                case .Color(let color):
                    color.fullFrame()
                case .blurView(let style):
                    BlurView(style: style)
                case .LinearGradient(let style):
                    style
                        .fullFrame()
               }
            }
            .fullFrame()
            .reverseMask {
                RoundedRectangle(cornerRadius: viewModel.cornerRadius)
                    .fill(Color.white)
                    .frame(width: viewModel.maskSize.width, height: viewModel.maskSize.height)
                    .position(viewModel.maskPosition)
                
                    
                    
            }
            .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 3)
            .onTapGesture {
                self.viewModel.nextTip()
            }
            
            RoundedRectangle(cornerRadius: viewModel.cornerRadius)
                .fill(Color.clear)
                .frame(width: viewModel.maskSize.width, height: viewModel.maskSize.height)
                .border(lineWidth: viewModel.config.maskBorderWidth, cornerRadius: viewModel.cornerRadius, color: viewModel.config.maskBorderColor)
                .position(viewModel.maskPosition)
            
                
            
            VStack(alignment: .leading){
                if viewModel.isPopUpViewShow  {
                    VStack(spacing :5){
                        if let title = viewModel.title {
                            Text(title)
                                .font(viewModel.config.titleFont)
                                .fontWeight(.bold)
                                .foregroundColor(viewModel.config.titleColor)
                                .contentTransition(.numericText())
                                .fullWidth(alignment: .leading)
                        }
                        
                        if let message = viewModel.message {
                            Text(message)
                                .font(viewModel.config.messageFont)
                                .foregroundColor(viewModel.config.messageColor)
                                .contentTransition(.numericText())
                                .fullWidth(alignment: .leading)
                        }
                    }
                    .padding()
                    .padding(viewModel.contentAllignment == .bottom ? .bottom : .top,  viewModel.config.popupViewAnchorPadding)
                    .background(content: {
                        ZStack{
                            switch viewModel.config.popupViewBackround {
                            case .clear:
                                Color.black.opacity(0.0001)
                                    .fullFrame()
                            case .Color(let color):
                                color.fullFrame()
                            case .blurView(let style):
                                BlurView(style: style)
                            case .LinearGradient(let style):
                                style
                                    .fullFrame()
                           }
                        }
                        .fullFrame()
                        .mask {
                            VStack(spacing: 0){
                                
                                if viewModel.contentAllignment == .top && viewModel.config.popupViewAnchorShow {
                                   RoundedRectangle(cornerRadius: 0)
                                        .fill(Color.white)
                                        .squareFrame(size: 10)
                                        .rotationEffect(.degrees(45))
                                      .offset(x: viewModel.maskPosition.x - self.screenWidth/2,y: 5)
                                        .matchedGeometryEffect(id: "arrow", in: animation)
                                }
                                
                                RoundedRectangle(cornerRadius: viewModel.config.popupViewCornerRadius)
                                
                                if viewModel.contentAllignment == .bottom && viewModel.config.popupViewAnchorShow{
                                   RoundedRectangle(cornerRadius: 0)
                                        .fill(Color.white)
                                        .squareFrame(size: 10)
                                        .rotationEffect(.degrees(45))
                                        .offset(x: viewModel.maskPosition.x - self.screenWidth/2,y: -5)
                                        .matchedGeometryEffect(id: "arrow", in: animation)
                                }
                            }
                        }
                        .shadow(color: Color.black.opacity(viewModel.config.popupviewShadowOpacity), radius: viewModel.config.popupViewShadowRadius, x: viewModel.config.popupviewShadowOffset.x, y: viewModel.config.popupviewShadowOffset.y)
                        
                    })
                    .padding()
                    .transition(.scale(scale: 0, anchor: viewModel.contentAllignment == .bottom ? .bottom : .top).combined(with: .opacity))
                }
                
               
                
            }.frame(width: viewModel.contentWraperRect.width, height: viewModel.contentWraperRect.height, alignment: viewModel.contentAllignment)
            .position(x: viewModel.contentWraperRect.origin.x,y: viewModel.contentWraperRect.origin.y)
            
        }
        .ignoreSafeArea_C()
        .fullFrame()
        .onAppear {
            viewModel.showAllToolTip()
        }
    }
}

#Preview {
    ToolTipView()
}
