//
//  ManagerAnswercreateGame.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/09.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct ManagerAnswercreateGame: View {
    @State var ManagerCreateOnBoard = [Board(title: "試合を作成したい！", detail: "まず「大会関係者専用ページ」の「試合を作成する」を開いて下さい。", pic: "manager2"),
            
            Board(title: "試合内容を記入しよう！", detail: "「試合作成」ページにて試合を作成する団体の「団体番号」と「団体パスワード」を入力し、試合内容を入力して下さい。内容に不備が無いか確認し「登録」ボタンを押しましょう。試合の作成が完了しました！", pic: "manager3"),
            
        ]
    
    @State var index = 0
    @Binding var ManagerGameCreateSelected: Bool

    var body: some View {
        VStack{
                ScrollView{
                            Image(self.ManagerCreateOnBoard[self.index].pic)
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width, height: 500)
                            
                            HStack(spacing: 10){
                                
                               ForEach(0..<self.ManagerCreateOnBoard.count,id: \.self){i in
                                    
                                    Circle()
                                        .fill(self.index == i ? Color.gray : Color.black.opacity(0.07))
                                        .frame(width: 10, height: 10)
                                }
                            }
                            .padding(.top,10)
                            
                            Text(self.ManagerCreateOnBoard[self.index].title)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Text(self.ManagerCreateOnBoard[self.index].detail)
                                .foregroundColor(.black)
                                .padding(.top)
                                .padding(.horizontal, 20)
                            
                            Spacer(minLength: 0)
                            
                            Button(action: {
                                if self.index < self.ManagerCreateOnBoard.count - 1{
                                    self.index += 1
                                }
                                                         
                            }) {
                                
                                HStack(spacing: 10){
                                    
                                    if self.index == self.ManagerCreateOnBoard.count - 1{
                                       Button(action: {
                                       UserDefaults.standard.set(false, forKey: "firststatus")

                                           self.ManagerGameCreateSelected.toggle()
                                       }){
                                           Text("戻る")
                                           .foregroundColor(.white)
                                           .fontWeight(.bold)
                                       }
                                   }
                                    
                                    Text(self.index == self.ManagerCreateOnBoard.count - 1 ? "" : "次へ")
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


struct ManagerAnswercreateGame_Previews: PreviewProvider {
    static var previews: some View {
        ManagerAnswercreateGame(ManagerGameCreateSelected: .constant(false))
    }
}
