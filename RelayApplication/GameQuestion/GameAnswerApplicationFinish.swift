//
//  GameAnswerApplicationFinish.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/08.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct GameAnswerApplicationFinish: View {
    @State var GameFinishOnBoard = [Board(title: "エントリーを完了させたい！", detail: "試合申し込み直後の試合内容はこのようになっているはずです。申し込みをした大会の運営者の指示通りに試合費用をお支払い下さい。", pic: "game9"),
            
            Board(title: "エントリー完了！", detail: "試合費用の確認が出来次第エントリー完了となります。エントリーが完了すると試合内容が変更しますのでご確認下さい。", pic: "game15"),
            
        ]
    
    @State var index = 0
    @Binding var GameFinishSelected: Bool
    var body: some View {
      VStack{
            ScrollView{
                    Image(self.GameFinishOnBoard[self.index].pic)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: 500)
                    
                    HStack(spacing: 10){
                        
                       ForEach(0..<self.GameFinishOnBoard.count,id: \.self){i in
                            
                            Circle()
                                .fill(self.index == i ? Color.gray : Color.black.opacity(0.07))
                                .frame(width: 10, height: 10)
                        }
                    }
                    .padding(.top,10)
                    
                    Text(self.GameFinishOnBoard[self.index].title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text(self.GameFinishOnBoard[self.index].detail)
                        .foregroundColor(.black)
                        .padding(.top)
                        .padding(.horizontal, 20)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        if self.index < self.GameFinishOnBoard.count - 1{
                            self.index += 1
                        }
                                                 
                    }) {
                        
                        HStack(spacing: 10){
                            
                            if self.index == self.GameFinishOnBoard.count - 1{
                               Button(action: {
                               UserDefaults.standard.set(false, forKey: "firststatus")

                                   self.GameFinishSelected.toggle()
                               }){
                                   Text("戻る")
                                   .foregroundColor(.white)
                                   .fontWeight(.bold)
                               }
                           }
                            
                            Text(self.index == self.GameFinishOnBoard.count - 1 ? "" : "次へ")
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


struct GameAnswerApplicationFinish_Previews: PreviewProvider {
    static var previews: some View {
        GameAnswerApplicationFinish(GameFinishSelected: .constant(false))
    }
}


