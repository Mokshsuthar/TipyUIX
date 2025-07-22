//
//  HomeView.swift
//  ToolTipLIb
//
//  Created by Moksh on 19/07/25.
//

import SwiftUI
import SwiftyUIX
import TipyUIX

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color(hexString: "#4d7b85"),Color.white], startPoint: .top, endPoint: .bottom)
            
            VStack{
                Spacer()
                    .topSafeArea()
                
                systemImage("bolt.fill")
                    .foregroundStyle(LinearGradient(colors: [Color.white.opacity(0.6),Color.white.opacity(0)], startPoint: .top, endPoint: .bottom))
                    .squareFrame(size: 300)
                    .registerToolTip(title: "Big Bolt", message: "Something here", cornerRadius: 20, order: 0)
                    .onTapGesture {
                        viewModel.changeTheme()
                    }
                
                Spacer()
            }
            
            VStack{
                Spacer()
                
                
                ZStack{
                    VStack{
                        HStack{
                            systemImage("bolt.fill")
                                .padding(10)
                                .squareFrame(size: 40)
                                .foregroundColor(Color.white)
                                .background(Color.black)
                                .cornerRadius(20)
                                .registerToolTip(title: "Logo", message: "Tap on logo to view more", cornerRadius: 40,order: 1)
                            
                            VStack(alignment: .leading, spacing : 0){
                                Text("Shazam Energy")
                                    .font(.headline)
                                Text("Enlight Your life")
                                    .font(.footnote)
                            }
                            .fullWidth(height: 40, alignment: .leading)
                           
                            
                            systemImage("xmark")
                                .padding(12)
                                .font(.system(size: 20, weight: .bold))
                                .squareFrame(size: 40)
                                .foregroundColor(Color.black)
                                .cornerRadius(20)
                        }
                        HStack{
                            ForEach(viewModel.powerUsesDataArray){useData in
                                HStack{
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.black)
                                        .offset(y: 150 * (useData.percentages/100))
                                    
                                }
                                .fullFrame(alignment: .bottom)
                                .background(Color.black.opacity(0.1))
                                .cornerRadius(5)
//                                .registerToolTip(title: "Send", message: "To share with friends", cornerRadius: 20,order: 7)
                            }
                        }.fullWidth(height: 150)
                        .registerToolTip(title: "This is Grapht", message: "Observe the usage of your energy", cornerRadius: 20,order: 2)
                        
                        VStack{
                            Text("This Year")
                                .font(.title3)
//                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .fullWidth(alignment: .leading)
                            
                            Text("You have used 356Khw of energy this year, you have prosuded 264kwh of electricity from your grid")
                                .font(.subheadline)
//                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .fullWidth(alignment: .leading)
                        }
                        
                        HStack{
                            Spacer()
                            
                            systemImage("keyboard")
                                .foregroundColor(Color.black)
                                .padding(14)
                                .squareFrame(size: 50)
                                .background(Color.black.opacity(0.2))
                                .cornerRadius(8)
                                .registerToolTip(title: "Keyboard", message: "On keys so small, yet vast they seem,A world unfolds in a glowing beam.Each tap a note, each press a rhyme,A symphony of words through space and time.", cornerRadius: 20,order: 6)
                            
                            systemImage("paperplane.fill")
                                .foregroundColor(Color.white)
                                .padding(14)
                                .squareFrame(size: 50)
                                .background(Color.black)
                                .cornerRadius(8)
                                .registerToolTip(title: "Send", message: "To share with friends", cornerRadius: 20,order: 7)
                        }
                    }
                }
                .padding()
                .fullWidth()
                .background( LinearGradient(colors: [Color(hexString: "##fafe82").opacity(0.3),Color(hexString: "#fafe82")], startPoint: .top, endPoint: .bottom))
                .cornerRadius(35, corners: .topLeft)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 4)
                .registerToolTip(title: "This the card", message: "Then let's create three buttons that will tell ScrollView to change its position — scroll to the very top, the bottom, or to the next view.", cornerRadius: 20,order: 7)
                .padding()
                
                
                
                ZStack{
                   RoundedRectangle(cornerRadius: 5)
                        .fill(Color.black.opacity(0.1))
                        .padding(5)
                        .squareFrame(size: 55)
                    HStack(spacing : 0){
                        systemImage("lock")
                            .padding()
                            .squareFrame(size: 55)
                            .registerToolTip(title: "Lock", message: "Tap on logo to view more", cornerRadius: 20,order: 3)
                        
                        systemImage("gamecontroller.fill")
                            .padding()
                            .squareFrame(size: 55)
                            .registerToolTip(title: "Gameboy", message: "Tap on logo to view more", cornerRadius: 40,order: 4)
                        
                        systemImage("figure.walk")
                            .padding()
                            .squareFrame(size: 55)
                            .registerToolTip(title: "Walk", message: "Tap on logo to view more", cornerRadius: 20,order: 5)
                    }
                }
                .background(.ultraThinMaterial)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 4)
                Spacer()
                    .bottomSafeArea()
            }
            
           
        }
        .ignoreSafeArea_C()
        .fullFrame()
        .onAppear(perform: viewModel.didAppear)
    }
}

#Preview {
    HomeView()
}
