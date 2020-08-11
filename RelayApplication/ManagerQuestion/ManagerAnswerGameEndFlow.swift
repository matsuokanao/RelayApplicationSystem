//
//  ManagerAnswerGameEndFlow.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/09.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct ManagerAnswerGameEndFlow: View {
    @State var ManagerGameEndFlowOnBoard = [Board(title: "大会を終了させよう！", detail: "試合を終了させ流ことによって試合が「終了した試合一覧」リストに移動します。「大会関係者専用ページ」の「試合のエントリーリスト」を開いて下さい。", pic: "manager8"),
               
               Board(title: "試合終了画面に移動しよう！", detail: "「エントリーリスト」画面の試合を終了させるボタンを押して下さい。", pic: "manager9"),
               
               Board(title: "完了！", detail: "「運営団体番号」と「運営団体パスワード」を記入し終了させたい試合を選んでください。試合が終了します！", pic: "manager10"),
           ]
       
       @State var index = 0
       @Binding var ManagerGameEndFlowSelected: Bool
    var body: some View {
      VStack{
         ScrollView{
            Image(self.ManagerGameEndFlowOnBoard[self.index].pic)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: 500)
                        
                        HStack(spacing: 10){
                            
                           ForEach(0..<self.ManagerGameEndFlowOnBoard.count,id: \.self){i in
                                
                                Circle()
                                    .fill(self.index == i ? Color.gray : Color.black.opacity(0.07))
                                    .frame(width: 10, height: 10)
                            }
                        }
                        .padding(.top,10)
                        
                        Text(self.ManagerGameEndFlowOnBoard[self.index].title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text(self.ManagerGameEndFlowOnBoard[self.index].detail)
                            .foregroundColor(.black)
                            .padding(.top)
                            .padding(.horizontal, 20)
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            if self.index < self.ManagerGameEndFlowOnBoard.count - 1{
                                self.index += 1
                            }
                                                     
                        }) {
                            
                            HStack(spacing: 10){
                                
                                if self.index == self.ManagerGameEndFlowOnBoard.count - 1{
                                   Button(action: {
                                   UserDefaults.standard.set(false, forKey: "firststatus")

                                       self.ManagerGameEndFlowSelected.toggle()
                                   }){
                                       Text("戻る")
                                       .foregroundColor(.white)
                                       .fontWeight(.bold)
                                   }
                               }
                                
                                Text(self.index == self.ManagerGameEndFlowOnBoard.count - 1 ? "" : "次へ")
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


struct ManagerAnswerGameEndFlow_Previews: PreviewProvider {
    static var previews: some View {
        ManagerAnswerGameEndFlow(ManagerGameEndFlowSelected: .constant(false))
    }
}
