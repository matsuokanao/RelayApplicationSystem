//
//  GameAnswerApplicationShow.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/08.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct GameAnswerApplicationShow: View {
    @State var GameShowOnBoard = [Board(title: "試合を確認しよう！", detail: "「試合画面」にて「試合申し込みリスト」を開きましょう。", pic: "game6"),
            
            Board(title: "試合リストを確認しよう！", detail: "「試合申し込みリスト」にて試合申し込み時に記入した「ユーザーパス」と「メールアドレス」を入力して下さい。試合リストが表示されます。内容を確認したい試合を選びましょう！", pic: "game7"),
            
            Board(title: "内容を確認しよう！", detail: "選択した試合の内容が確認できます！", pic: "game8"),
        ]
    
    @State var index = 0
    @Binding var ApplicationShowSelected: Bool

    var body: some View {
         VStack{
            ScrollView{
                           
            Image(self.GameShowOnBoard[self.index].pic)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: 500)
                        
            HStack(spacing: 10){
                            
                              ForEach(0..<self.GameShowOnBoard.count,id: \.self){i in
                                   
                                   Circle()
                                       .fill(self.index == i ? Color.gray : Color.black.opacity(0.07))
                                       .frame(width: 10, height: 10)
                               }
                           }
                           .padding(.top,10)
                           
                           Text(self.GameShowOnBoard[self.index].title)
                               .font(.title)
                               .fontWeight(.bold)
                               .foregroundColor(.black)
                           
                           Text(self.GameShowOnBoard[self.index].detail)
                               .foregroundColor(.black)
                               .padding(.top)
                               .padding(.horizontal, 20)
                           
                           Spacer(minLength: 0)
                           
                           Button(action: {
                               if self.index < self.GameShowOnBoard.count - 1{
                                   self.index += 1
                               }
                                                        
                           }) {
                               
                               HStack(spacing: 10){
                                   
                                   if self.index == self.GameShowOnBoard.count - 1{
                                      Button(action: {
                                      UserDefaults.standard.set(false, forKey: "firststatus")

                                          self.ApplicationShowSelected.toggle()
                                      }){
                                          Text("戻る")
                                          .foregroundColor(.white)
                                          .fontWeight(.bold)
                                      }
                                  }
                                   
                                   Text(self.index == self.GameShowOnBoard.count - 1 ? "" : "次へ")
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
struct GameAnswerApplicationShow_Previews: PreviewProvider {
    static var previews: some View {
        GameAnswerApplicationShow(ApplicationShowSelected: .constant(false))
    }
}

