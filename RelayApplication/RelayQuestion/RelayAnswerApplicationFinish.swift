//
//  RelayAnswerApplicationFinish.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/09.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct RelayAnswerApplicationFinish: View {
    @State var RelayFinisOnBoard = [Board(title: "エントリーを完了させたい！", detail: "試合申し込み直後の試合内容はこのようになっているはずです。申し込みをした大会の運営者の指示通りに試合費用をお支払い下さい。試合費用は代表者がお支払いください。", pic: "relay8"),
            //TODO
            Board(title: "エントリー完了！", detail: "試合費用の確認が出来次第エントリー完了となります。エントリーが完了すると試合内容が変更しますのでご確認下さい。", pic: "relay13"),
            
        ]
    
    @State var index = 0
    @Binding var RelayFinishSelected: Bool
    
    var body: some View {
        VStack{
            ScrollView{
                    Image(self.RelayFinisOnBoard[self.index].pic)
                        .resizable()
                       .frame(width: UIScreen.main.bounds.width, height: 500)
                                   
                HStack(spacing: 10){
                    ForEach(0..<self.RelayFinisOnBoard.count,id: \.self){i in
                                    Circle()
                                               .fill(self.index == i ? Color.gray : Color.black.opacity(0.07))
                                               .frame(width: 10, height: 10)
                                       }
                                   }
                                   .padding(.top,10)
                                   
                                   Text(self.RelayFinisOnBoard[self.index].title)
                                       .font(.title)
                                       .fontWeight(.bold)
                                       .foregroundColor(.black)
                                   
                                   Text(self.RelayFinisOnBoard[self.index].detail)
                                       .foregroundColor(.black)
                                       .padding(.top)
                                       .padding(.horizontal, 20)
                                   
                                   Spacer(minLength: 0)
                                   
                                   Button(action: {
                                       if self.index < self.RelayFinisOnBoard.count - 1{
                                           self.index += 1
                                       }
                                                                
                                   }) {
                                       
                                       HStack(spacing: 10){
                                           
                                           if self.index == self.RelayFinisOnBoard.count - 1{
                                              Button(action: {
                                              UserDefaults.standard.set(false, forKey: "firststatus")

                                                  self.RelayFinishSelected.toggle()
                                              }){
                                                  Text("戻る")
                                                  .foregroundColor(.white)
                                                  .fontWeight(.bold)
                                              }
                                          }
                                           
                                           Text(self.index == self.RelayFinisOnBoard.count - 1 ? "" : "次へ")
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

struct RelayAnswerApplicationFinish_Previews: PreviewProvider {
    static var previews: some View {
        RelayAnswerApplicationFinish(RelayFinishSelected: .constant(false))
    }
}
