//
//  ManagerAnswerRelayOrderList.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/09.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct ManagerAnswerRelayOrderList: View {
    @State var ManagerGameOrderOnBoard = [Board(title: "オーダーリストとは？", detail: "リレーの当日オーダーを確認することが出来ます。", pic: "manager16"),
            
        ]
    
    @State var index = 0
    @Binding var ManagerRelayOrderSelected: Bool

    var body: some View {
        VStack{
             ScrollView{
                Image(self.ManagerGameOrderOnBoard[self.index].pic)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width, height: 500)
                            
                            HStack(spacing: 10){
                                
                               ForEach(0..<self.ManagerGameOrderOnBoard.count,id: \.self){i in
                                    
                                    Circle()
                                        .fill(self.index == i ? Color.gray : Color.black.opacity(0.07))
                                        .frame(width: 10, height: 10)
                                }
                            }
                            .padding(.top,10)
                            
                            Text(self.ManagerGameOrderOnBoard[self.index].title)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Text(self.ManagerGameOrderOnBoard[self.index].detail)
                                .foregroundColor(.black)
                                .padding(.top)
                                .padding(.horizontal, 20)
                            
                            Spacer(minLength: 0)
                            
                            Button(action: {
                                if self.index < self.ManagerGameOrderOnBoard.count - 1{
                                    self.index += 1
                                }
                                                         
                            }) {
                                
                                HStack(spacing: 10){
                                    
                                    if self.index == self.ManagerGameOrderOnBoard.count - 1{
                                       Button(action: {
                                       UserDefaults.standard.set(false, forKey: "firststatus")

                                           self.ManagerRelayOrderSelected.toggle()
                                       }){
                                           Text("戻る")
                                           .foregroundColor(.white)
                                           .fontWeight(.bold)
                                       }
                                   }
                                    
                                    Text(self.index == self.ManagerGameOrderOnBoard.count - 1 ? "" : "次へ")
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


struct ManagerAnswerRelayOrderList_Previews: PreviewProvider {
    static var previews: some View {
        ManagerAnswerRelayOrderList(ManagerRelayOrderSelected: .constant(false))
    }
}
