//
//  ManagerAnswerGameEdit.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/09.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct ManagerAnswerGameEdit: View {
    @State var ManagerGameEditOnBoard = [Board(title: "試合内容を変更しよう！", detail: "大会関係者専用ページ」の「試合情報を閲覧、編集する」を開いて下さい。", pic: "manager11"),
            
            Board(title: "試合を選ぼう！", detail: "「運営団体番号」と「運営団体パスワード」を記入し内容を変更したい試合を選んでください", pic: "manager12"),
            
            Board(title: "内容を選ぼう！", detail: "試合内容一覧が表示されます。変更したい内容を選択しましょう。", pic: "manager13"),
            
            Board(title: "変更完了！", detail: "正しい内容を記入して下さい。変更が完了します！", pic: "manager14"),
        ]
    
    @State var index = 0
    @Binding var ManagerGameEditSelected: Bool

    var body: some View {
        VStack{
             ScrollView{
                Image(self.ManagerGameEditOnBoard[self.index].pic)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width, height: 500)
                            
                            HStack(spacing: 10){
                                
                               ForEach(0..<self.ManagerGameEditOnBoard.count,id: \.self){i in
                                    
                                    Circle()
                                        .fill(self.index == i ? Color.gray : Color.black.opacity(0.07))
                                        .frame(width: 10, height: 10)
                                }
                            }
                            .padding(.top,10)
                            
                            Text(self.ManagerGameEditOnBoard[self.index].title)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Text(self.ManagerGameEditOnBoard[self.index].detail)
                                .foregroundColor(.black)
                                .padding(.top)
                                .padding(.horizontal, 20)
                            
                            Spacer(minLength: 0)
                            
                            Button(action: {
                                if self.index < self.ManagerGameEditOnBoard.count - 1{
                                    self.index += 1
                                }
                                                         
                            }) {
                                
                                HStack(spacing: 10){
                                    
                                    if self.index == self.ManagerGameEditOnBoard.count - 1{
                                       Button(action: {
                                       UserDefaults.standard.set(false, forKey: "firststatus")

                                           self.ManagerGameEditSelected.toggle()
                                       }){
                                           Text("戻る")
                                           .foregroundColor(.white)
                                           .fontWeight(.bold)
                                       }
                                   }
                                    
                                    Text(self.index == self.ManagerGameEditOnBoard.count - 1 ? "" : "次へ")
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


struct ManagerAnswerGameEdit_Previews: PreviewProvider {
    static var previews: some View {
        ManagerAnswerGameEdit(ManagerGameEditSelected: .constant(false))
    }
}
