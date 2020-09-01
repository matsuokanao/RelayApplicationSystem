//
//  ManagerAnswerGameFlow.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/09.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct ManagerAnswerGameFlow: View {
    @State var ManagerGameFlowOnBoard = [Board(title: "試合内容に間違いが無いか確認しよう！",
                                               detail: "試合画面」にて「申し込む」をクリックし、試合が表示されるか、試合内容が正しく入力できているか確認しましょう。",
                                               pic: "game2"),
                                         
                                         Board(title: "エントリーを承認しよう！",
                                               detail: "「大会関係者専用ページ」の「エントリーを承認する」を開いて下さい。",
                                               pic: "manager4"),
                                         
                                         Board(title: "試合リストが表示されます！",
                                               detail: "「承認ページ」にて「団体番号」と「団体パスワード」を入力し試合を選んでください。",
                                               pic: "manager5"),
                                         
                                         Board(title: "選手リストが表示されます！",
                                               detail:"試合に申込み中の選手リストが表示されます。試合費用のお支払いが確認できた選手名を選び画面右の矢印を押して下さい。", pic: "manager6"),
                                         
                                         Board(title: "承認完了！",
                                               detail: "選手名、種目を確認し「承認」ボタンを押して下さい。エントリーの承認が完了しました！",
                                               pic: "manager7"),
    ]
    
    @State var index = 0
    @Binding var ManagerGameFlowSelected: Bool
    
    var body: some View {
        VStack{
            ScrollView{
                Image(self.ManagerGameFlowOnBoard[self.index].pic)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: 500)
                
                HStack(spacing: 10){
                    
                    ForEach(0..<self.ManagerGameFlowOnBoard.count,id: \.self){i in
                        
                        Circle()
                            .fill(self.index == i ? Color.gray : Color.black.opacity(0.07))
                            .frame(width: 10, height: 10)
                    }
                }
                .padding(.top,10)
                
                Text(self.ManagerGameFlowOnBoard[self.index].title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(self.ManagerGameFlowOnBoard[self.index].detail)
                    .foregroundColor(.black)
                    .padding(.top)
                    .padding(.horizontal, 20)
                
                Spacer(minLength: 0)
                
                Button(action: {
                    if self.index < self.ManagerGameFlowOnBoard.count - 1{
                        self.index += 1
                    }
                    
                }) {
                    
                    HStack(spacing: 10){
                        
                        if self.index == self.ManagerGameFlowOnBoard.count - 1{
                            Button(action: {
                                UserDefaults.standard.set(false, forKey: "firststatus")
                                
                                self.ManagerGameFlowSelected.toggle()
                            }){
                                Text("戻る")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }
                        }
                        
                        Text(self.index == self.ManagerGameFlowOnBoard.count - 1 ? "" : "次へ")
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


struct ManagerAnswerGameFlow_Previews: PreviewProvider {
    static var previews: some View {
        ManagerAnswerGameFlow(ManagerGameFlowSelected: .constant(false))
    }
}
