//
//  GameAnswerApplication.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/08.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct GameAnswerApplication: View {
    @State var GameApplicationonBoard = [Board(title: "まずはユーザー登録！", detail: "まず試合に申し込む前に「HOME画面」にてユーザー登録を行って下さい。その際に「ユーザーパス」を記入しますが、試合登録の際に必要になりますので忘れないようにして下さい。", pic: "game1"),
            
            Board(title: "試合に申し込もう！", detail: "次に「試合画面」にて試合申し込みを行いましょう。「申し込む」をクリックして下さい。", pic: "game2"),
            
            Board(title: "試合を探そう！", detail: "出場したい試合の開催都道府県を記入し試合を探しましょう。", pic: "game3"),
            
            Board(title: "出場種目を記入しよう！", detail: "試合を選択し、画面の空欄をお手本通りに記入しましょう。ユーザーパスとメールアドレスは試合を申し込む本人の情報を記入しましょう。全ての項目を記入した後「確認する」ボタンを押して下さい。", pic: "game4"),
            
            Board(title: "確認しよう！", detail: "最後に確認画面です。入力した内容に不備がないか確認し、「申し込み」ボタンを押しましょう。以上で試合申し込みが完了となります。", pic: "game5"),
        ]
    
    @State var index = 0
    @Binding var ApplicationSelected: Bool
    var body: some View {
        VStack{
            ScrollView{
                     
                     Image(self.GameApplicationonBoard[self.index].pic)
                     .resizable()
                     .frame(width: UIScreen.main.bounds.width, height: 500)
                     
                     HStack(spacing: 10){
                         
                        ForEach(0..<self.GameApplicationonBoard.count,id: \.self){i in
                             
                             Circle()
                                 .fill(self.index == i ? Color.gray : Color.black.opacity(0.07))
                                 .frame(width: 10, height: 10)
                         }
                     }
                     .padding(.top,10)
                     
                     Text(self.GameApplicationonBoard[self.index].title)
                         .fontWeight(.bold)
                        .font(.title)
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
                }
                         
                     }
                 }.frame(width: 350, height: 600)
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
