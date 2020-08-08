//
//  GameAnswerApplication.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/08.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct GameAnswerApplication: View {
    @State var GameApplicationonBoard = [Board(title: "試合申し込み方法", detail: "Data analysis is a process of inspecting, cleansing, transforming and modeling data with the goal of discovering useful information, informing conclusions and supporting decision-making.", pic: "runcatview"),
            
            Board(title: "Social Media！！", detail: "Social media are interactive computer-mediated technologies that facilitate the creation or sharing of information, ideas, career interests and other forms of expression via virtual communities and networks.", pic: "b2"),
            
            Board(title: "Software Development", detail: "Software development is the process of conceiving, specifying, designing, programming, documenting, testing, and bug fixing involved in creating and maintaining applications, frameworks, or other software components.", pic: "b3"),
        ]
    
    @State var index = 0
    @Binding var ApplicationSelected: Bool
    var body: some View {
        VStack{
                     
                     Image(self.GameApplicationonBoard[self.index].pic)
                     .resizable()
                     .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                     
                     HStack(spacing: 10){
                         
                        ForEach(0..<self.GameApplicationonBoard.count,id: \.self){i in
                             
                             Circle()
                                 .fill(self.index == i ? Color.gray : Color.black.opacity(0.07))
                                 .frame(width: 10, height: 10)
                         }
                     }
                     .padding(.top,10)
                     
                     Text(self.GameApplicationonBoard[self.index].title)
                         .font(.title)
                         .fontWeight(.bold)
                         .foregroundColor(.black)
                     
                     Text(self.GameApplicationonBoard[self.index].detail)
                         .foregroundColor(.black)
                         .padding(.top)
                         .padding(.horizontal, 20)
                     
                     Spacer(minLength: 0)
                     
                     Button(action: {
                         if self.index < self.GameApplicationonBoard.count - 1{
                             self.index += 1
                         }
                                                  
                     }) {
                         
                         HStack(spacing: 10){
                             
                             if self.index == self.GameApplicationonBoard.count - 1{
                                Button(action: {
                                UserDefaults.standard.set(false, forKey: "firststatus")

                                    self.ApplicationSelected.toggle()
                                }){
                                    Text("戻る")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                }
                            }
                             
                             Text(self.index == self.GameApplicationonBoard.count - 1 ? "" : "次へ")
                                 .foregroundColor(.white)
                                 .fontWeight(.bold)
                             
                         }
                         .padding(.vertical)
                         .frame(width: UIScreen.main.bounds.width - 200)
                         .background(Color.red)
                         .clipShape(Capsule())
                         .padding(.bottom, 70)
                     }
                 }.frame(width: 300, height: 600)
                 .edgesIgnoringSafeArea(.top)
             }
         }
        
struct GameAnswerApplication_Previews: PreviewProvider {
    static var previews: some View {
        GameAnswerApplication(ApplicationSelected: .constant(false))
    }
}



struct Board {
    var title : String
    var detail : String
    var pic : String
}