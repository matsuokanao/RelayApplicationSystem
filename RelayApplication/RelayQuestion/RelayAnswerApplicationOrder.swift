//
//  RelayAnswerApplicationOrder.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/09.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct RelayAnswerApplicationOrder: View {
    //TODO 試合承認後の処理
    @State var RelayOrderOnBoard = [Board(title: "オーダー表を提出したい！", detail: "「リレー画面」の「リレーオーダー表を提出する」を開いて下さい。試合費用をお支払いしていない場合は提出できませんのでご注意下さい。", pic: "relay10"),
            
            Board(title: "Social Media！！", detail: "Social media are interactive computer-mediated technologies that facilitate the creation or sharing of information, ideas, career interests and other forms of expression via virtual communities and networks.", pic: "b2"),
            
            Board(title: "Software Development", detail: "Software development is the process of conceiving, specifying, designing, programming, documenting, testing, and bug fixing involved in creating and maintaining applications, frameworks, or other software components.", pic: "b3"),
        ]
    
    @State var index = 0
    @Binding var RelayOrderSelected: Bool
    
    var body: some View {
        VStack{
            ScrollView{
                           Image(self.RelayOrderOnBoard[self.index].pic)
                               .resizable()
                               .frame(width: UIScreen.main.bounds.width, height: 500)
                                          
                       HStack(spacing: 10){
                           ForEach(0..<self.RelayOrderOnBoard.count,id: \.self){i in
                                           Circle()
                                                      .fill(self.index == i ? Color.gray : Color.black.opacity(0.07))
                                                      .frame(width: 10, height: 10)
                                              }
                                          }
                                          .padding(.top,10)
                                          
                                          Text(self.RelayOrderOnBoard[self.index].title)
                                              .font(.title)
                                              .fontWeight(.bold)
                                              .foregroundColor(.black)
                                          
                                          Text(self.RelayOrderOnBoard[self.index].detail)
                                              .foregroundColor(.black)
                                              .padding(.top)
                                              .padding(.horizontal, 20)
                                          
                                          Spacer(minLength: 0)
                                          
                                          Button(action: {
                                              if self.index < self.RelayOrderOnBoard.count - 1{
                                                  self.index += 1
                                              }
                                                                       
                                          }) {
                                              
                                              HStack(spacing: 10){
                                                  
                                                  if self.index == self.RelayOrderOnBoard.count - 1{
                                                     Button(action: {
                                                     UserDefaults.standard.set(false, forKey: "firststatus")

                                                         self.RelayOrderSelected.toggle()
                                                     }){
                                                         Text("戻る")
                                                         .foregroundColor(.white)
                                                         .fontWeight(.bold)
                                                     }
                                                 }
                                                  
                                                  Text(self.index == self.RelayOrderOnBoard.count - 1 ? "" : "次へ")
                                                      .foregroundColor(.white)
                                                      .fontWeight(.bold)
                                                  
                                              }
                                              .padding(.vertical)
                                              .frame(width: UIScreen.main.bounds.width - 200)
                                              .background(Color.red)
                                              .clipShape(Capsule())
                                              .padding(.bottom, 70)
                                }
                           }
                       }.frame(width: 300, height: 600)
                       .edgesIgnoringSafeArea(.top)
                   }
               }


struct RelayAnswerApplicationOrder_Previews: PreviewProvider {
    static var previews: some View {
        RelayAnswerApplicationOrder(RelayOrderSelected: .constant(false))
    }
}
