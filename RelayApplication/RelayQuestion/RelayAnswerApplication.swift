//
//  RelayAnswerApplication.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/08.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct RelayAnswerApplication: View {
    @State var RelayApplicationonBoard = [Board(title: "リレーに申し込もう！", detail: "まず「リレー」ページの「リレーに申し込む」を開いて下さい。", pic: "relay1"),
            
            Board(title: "試合を選ぼう！", detail: "出場したい試合の都道府県を入力し、試合を選びましょう。", pic: "relay2"),
            
            Board(title: "必要項目を入力しよう！", detail: "試合を選択し、画面の空欄をお手本通りに記入しましょう。ユーザーパスとメールアドレスは当日オーダーを提出する人物の情報を記入しましょう。全ての項目を記入した後「確認する」ボタンを押して下さい。", pic: "relay3"),
            
            Board(title: "確認しよう！", detail: "最後に確認画面です。入力した内容に不備がないか確認し、「申し込み」ボタンを押しましょう。以上でリレーの申し込みが完了となります。", pic: "relay4"),
        ]
    
    @State var index = 0
    @Binding var RelayApplicationSelected: Bool
    
    var body: some View {
       VStack{
            ScrollView{
                Image(self.RelayApplicationonBoard[self.index].pic)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: 500)
                
                    HStack(spacing: 10){
                        
                       ForEach(0..<self.RelayApplicationonBoard.count,id: \.self){i in
                            
                            Circle()
                                .fill(self.index == i ? Color.gray : Color.black.opacity(0.07))
                                .frame(width: 10, height: 10)
                        }
                    }
                    .padding(.top,10)
                    
                    Text(self.RelayApplicationonBoard[self.index].title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text(self.RelayApplicationonBoard[self.index].detail)
                        .foregroundColor(.black)
                        .padding(.top)
                        .padding(.horizontal, 20)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        if self.index < self.RelayApplicationonBoard.count - 1{
                            self.index += 1
                        }
                                                 
                    }) {
                        
                        HStack(spacing: 10){
                            
                            if self.index == self.RelayApplicationonBoard.count - 1{
                               Button(action: {
                               UserDefaults.standard.set(false, forKey: "firststatus")

                                   self.RelayApplicationSelected.toggle()
                               }){
                                   Text("戻る")
                                   .foregroundColor(.white)
                                   .fontWeight(.bold)
                               }
                           }
                            
                            Text(self.index == self.RelayApplicationonBoard.count - 1 ? "" : "次へ")
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


struct RelayAnswerApplication_Previews: PreviewProvider {
    static var previews: some View {
        RelayAnswerApplication(RelayApplicationSelected: .constant(false))
    }
}
