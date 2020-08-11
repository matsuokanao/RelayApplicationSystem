//
//  RelayAnswerApplicationEnd.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/09.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct RelayAnswerApplicationEnd: View {
    @State var RelayEndOnBoard = [Board(title: "試合が終了したら？", detail: "「リレー画面」にて「リレーの申し込みリスト」を開きましょう。", pic: "relay5"),
            
            Board(title: "終了させたい試合を選ぼう！", detail: "「リレーの申し込みリスト」にてリレー申し込み時に記入した「ユーザーパス」と「メールアドレス」を入力して下さい。リレーリストが表示されます。終了させたい試合を選びましょう！", pic: "relay6"),
            
            Board(title: "試合を終了させよう！", detail: "試合を選択し、画面右上の「終了した試合ですか？」を押して下さい。試合が終了します。", pic: "b3"),
            
            Board(title: "終了した試合を見たい！", detail: "「リレーの申し込みリスト」の「終了した試合一覧」画面にて内容を確認できます。", pic: "relay12"),
        ]
    
    @State var index = 0
    @Binding var RelayEndSelected: Bool
    
    var body: some View {
        VStack{
            ScrollView{
                           Image(self.RelayEndOnBoard[self.index].pic)
                               .resizable()
                               .frame(width: UIScreen.main.bounds.width, height: 500)
                                          
                       HStack(spacing: 10){
                           ForEach(0..<self.RelayEndOnBoard.count,id: \.self){i in
                                           Circle()
                                                      .fill(self.index == i ? Color.gray : Color.black.opacity(0.07))
                                                      .frame(width: 10, height: 10)
                                              }
                                          }
                                          .padding(.top,10)
                                          
                                          Text(self.RelayEndOnBoard[self.index].title)
                                              .font(.title)
                                              .fontWeight(.bold)
                                              .foregroundColor(.black)
                                          
                                          Text(self.RelayEndOnBoard[self.index].detail)
                                              .foregroundColor(.black)
                                              .padding(.top)
                                              .padding(.horizontal, 20)
                                          
                                          Spacer(minLength: 0)
                                          
                                          Button(action: {
                                              if self.index < self.RelayEndOnBoard.count - 1{
                                                  self.index += 1
                                              }
                                                                       
                                          }) {
                                              
                                              HStack(spacing: 10){
                                                  
                                                  if self.index == self.RelayEndOnBoard.count - 1{
                                                     Button(action: {
                                                     UserDefaults.standard.set(false, forKey: "firststatus")

                                                         self.RelayEndSelected.toggle()
                                                     }){
                                                         Text("戻る")
                                                         .foregroundColor(.white)
                                                         .fontWeight(.bold)
                                                     }
                                                 }
                                                  
                                                  Text(self.index == self.RelayEndOnBoard.count - 1 ? "" : "次へ")
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


struct RelayAnswerApplicationEnd_Previews: PreviewProvider {
    static var previews: some View {
        RelayAnswerApplicationEnd(RelayEndSelected: .constant(false))
    }
}
