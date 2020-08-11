//
//  GameAnswerDiaryDelete.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/08.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct GameAnswerDiaryDelete: View {
    @State var GameDiaryDeleteOnBoard = [Board(title: "試合日記を開こう！", detail: "試合日記ページの「試合一覧」ボタンを押しましょう。", pic: "game10"),
               
               Board(title: "削除したい日記を選ぼう！", detail: "項目を入力し削除した日記を選択して下さい。", pic: "game11"),
               
               Board(title: "日記を削除しよう！", detail: "画面の一番下にある「この日記を削除する」ボタンを押して下さい。日記に削除が完了します！", pic: "game12"),
           ]
       
       @State var index = 0
       @Binding var GameDiaryDeleteSelected: Bool
    var body: some View {
        VStack{
            ScrollView{
                Image(self.GameDiaryDeleteOnBoard[self.index].pic)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: 500)
                    
            HStack(spacing: 10){
                        
                       ForEach(0..<self.GameDiaryDeleteOnBoard.count,id: \.self){i in
                            
                            Circle()
                                .fill(self.index == i ? Color.gray : Color.black.opacity(0.07))
                                .frame(width: 10, height: 10)
                        }
                    }
                    .padding(.top,10)
                    
            Text(self.GameDiaryDeleteOnBoard[self.index].title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
            Text(self.GameDiaryDeleteOnBoard[self.index].detail)
                        .foregroundColor(.black)
                        .padding(.top)
                        .padding(.horizontal, 20)
                    
                    Spacer(minLength: 0)
                    
        Button(action: {
                        if self.index < self.GameDiaryDeleteOnBoard.count - 1{
                            self.index += 1
                        }
                                                 
                    }) {
                        
                        HStack(spacing: 10){
                            
                            if self.index == self.GameDiaryDeleteOnBoard.count - 1{
                               Button(action: {
                               UserDefaults.standard.set(false, forKey: "firststatus")

                                   self.GameDiaryDeleteSelected.toggle()
                               }){
                                   Text("戻る")
                                   .foregroundColor(.white)
                                   .fontWeight(.bold)
                               }
                           }
                            
                            Text(self.index == self.GameDiaryDeleteOnBoard.count - 1 ? "" : "次へ")
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

struct GameAnswerDiaryDelete_Previews: PreviewProvider {
    static var previews: some View {
        GameAnswerDiaryDelete(GameDiaryDeleteSelected: .constant(false))
    }
}
