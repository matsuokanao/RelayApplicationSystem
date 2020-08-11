//
//  ManagerAnswer.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/09.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct ManagerAnswer: View {
    @State var ManagerOnBoard = [Board(title: "運営団体情報とは？", detail: "試合作成、運営時に必要となる運営情報です。お申し込みをした代表者1名が書類の指示に沿って内容をご記入し、団体内で情報を共有して下さい。「運営団体パスワード」と「運営団体番号」は必要になりますので忘れないようにご注意下さい。", pic: "manager1"),
            
        ]
    
    @State var index = 0
    @Binding var ManagerSelected: Bool
    
    var body: some View {
        VStack{
             ScrollView{
                     Image(self.ManagerOnBoard[self.index].pic)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: 500)
                     
                     HStack(spacing: 10){
                         
                        ForEach(0..<self.ManagerOnBoard.count,id: \.self){i in
                             
                             Circle()
                                 .fill(self.index == i ? Color.gray : Color.black.opacity(0.07))
                                 .frame(width: 10, height: 10)
                         }
                     }
                     .padding(.top,10)
                     
                     Text(self.ManagerOnBoard[self.index].title)
                         .font(.title)
                         .fontWeight(.bold)
                         .foregroundColor(.black)
                     
                     Text(self.ManagerOnBoard[self.index].detail)
                         .foregroundColor(.black)
                         .padding(.top)
                         .padding(.horizontal, 20)
                     
                     Spacer(minLength: 0)
                     
                     Button(action: {
                         if self.index < self.ManagerOnBoard.count - 1{
                             self.index += 1
                         }
                                                  
                     }) {
                         
                         HStack(spacing: 10){
                             
                             if self.index == self.ManagerOnBoard.count - 1{
                                Button(action: {
                                UserDefaults.standard.set(false, forKey: "firststatus")

                                    self.ManagerSelected.toggle()
                                }){
                                    Text("戻る")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                }
                            }
                             
                             Text(self.index == self.ManagerOnBoard.count - 1 ? "" : "次へ")
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


struct ManagerAnswer_Previews: PreviewProvider {
    static var previews: some View {
        ManagerAnswer(ManagerSelected: .constant(false))
    }
}
