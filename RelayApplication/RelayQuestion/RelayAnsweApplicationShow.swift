//
//  RelayAnsweApplicationShow.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/08.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct RelayAnsweApplicationShow: View {
    @State var RelayShowOnBoard = [Board(title: "リレーを確認しよう！",
                                         detail: "「リレー画面」にて「リレーの申し込みリスト」を開きましょう。",
                                         pic: "relay5"),
                                   
                                   Board(title: "リレーリストを確認しよう！",
                                         detail: "「リレーの申し込みリスト」にてリレー申し込み時に記入した「ユーザーパス」と「メールアドレス」を入力して下さい。リレーリストが表示されます。内容を確認したい試合を選びましょう！",
                                         pic: "relay6"),
                                   
                                   Board(title: "内容を確認しよう！",
                                         detail: "選択したリレーの内容が確認できます！",
                                         pic: "relay7"),
    ]
    
    @State var index = 0
    @Binding var RelayApplicationShowSelected: Bool
    
    var body: some View {
        VStack{
            ScrollView{
                Image(self.RelayShowOnBoard[self.index].pic)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: 500)
                
                HStack(spacing: 10){
                    ForEach(0..<self.RelayShowOnBoard.count,id: \.self){i in
                        Circle()
                            .fill(self.index == i ? Color.gray : Color.black.opacity(0.07))
                            .frame(width: 10, height: 10)
                    }
                }
                .padding(.top,10)
                
                Text(self.RelayShowOnBoard[self.index].title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(self.RelayShowOnBoard[self.index].detail)
                    .foregroundColor(.black)
                    .padding(.top)
                    .padding(.horizontal, 20)
                
                Spacer(minLength: 0)
                
                Button(action: {
                    if self.index < self.RelayShowOnBoard.count - 1{
                        self.index += 1
                    }
                    
                }) {
                    
                    HStack(spacing: 10){
                        
                        if self.index == self.RelayShowOnBoard.count - 1{
                            Button(action: {
                                UserDefaults.standard.set(false, forKey: "firststatus")
                                
                                self.RelayApplicationShowSelected.toggle()
                            }){
                                Text("戻る")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }
                        }
                        
                        Text(self.index == self.RelayShowOnBoard.count - 1 ? "" : "次へ")
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

struct RelayAnsweApplicationShow_Previews: PreviewProvider {
    static var previews: some View {
        RelayAnsweApplicationShow(RelayApplicationShowSelected: .constant(false))
    }
}
