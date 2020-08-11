//
//  ManagerAnswerDelete.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/09.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct ManagerAnswerDelete: View {
    @State var ManagerDeleteOnBoard = [Board(title: "試合を削除しよう！", detail: "「大会関係者専用ページ」の「試合情報を閲覧、編集する」を開いて下さい。", pic: "manager11"),
            
            Board(title: "削除完了！", detail: "運営団体番号」と「運営団体パスワード」を記入し削除したい試合を選び、右の「削除」ボタンを押し、て下さい。削除が完了します。", pic: "manager15"),
            
        ]
    
    @State var index = 0
    @Binding var ManagerGameDeleteSelected: Bool

    var body: some View {
        VStack{
             ScrollView{
                Image(self.ManagerDeleteOnBoard[self.index].pic)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width, height: 500)
                            
                            HStack(spacing: 10){
                                
                               ForEach(0..<self.ManagerDeleteOnBoard.count,id: \.self){i in
                                    
                                    Circle()
                                        .fill(self.index == i ? Color.gray : Color.black.opacity(0.07))
                                        .frame(width: 10, height: 10)
                                }
                            }
                            .padding(.top,10)
                            
                            Text(self.ManagerDeleteOnBoard[self.index].title)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Text(self.ManagerDeleteOnBoard[self.index].detail)
                                .foregroundColor(.black)
                                .padding(.top)
                                .padding(.horizontal, 20)
                            
                            Spacer(minLength: 0)
                            
                            Button(action: {
                                if self.index < self.ManagerDeleteOnBoard.count - 1{
                                    self.index += 1
                                }
                                                         
                            }) {
                                
                                HStack(spacing: 10){
                                    
                                    if self.index == self.ManagerDeleteOnBoard.count - 1{
                                       Button(action: {
                                       UserDefaults.standard.set(false, forKey: "firststatus")

                                           self.ManagerGameDeleteSelected.toggle()
                                       }){
                                           Text("戻る")
                                           .foregroundColor(.white)
                                           .fontWeight(.bold)
                                       }
                                   }
                                    
                                    Text(self.index == self.ManagerDeleteOnBoard.count - 1 ? "" : "次へ")
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

struct ManagerAnswerDelete_Previews: PreviewProvider {
    static var previews: some View {
        ManagerAnswerDelete(ManagerGameDeleteSelected: .constant(false))
    }
}
