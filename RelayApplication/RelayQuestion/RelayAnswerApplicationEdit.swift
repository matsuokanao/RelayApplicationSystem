//
//  RelayAnswerApplicationEdit.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/09.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct RelayAnswerApplicationEdit: View {
    @State var RelayEditOnBoard = [Board(title: "試合内容の修正が可能な場合",
                                         detail: "試合費用が未払いの状態ですと試合内容の変更が可能です。お出数ですが正しい内容で再度試合を申込みし直してください。",
                                         pic: "relay11"),
                                   
                                   Board(title: "修正が可不可能な場合",
                                         detail: "試合費用をお支払いした後は試合内容を変更することが出来ません。ご注意下さい。",
                                         pic: "relay13"),
                                   
    ]
    
    @State var index = 0
    @Binding var RelayApplicationEditSelected: Bool
    
    var body: some View {
        VStack{
            ScrollView{
                Image(self.RelayEditOnBoard[self.index].pic)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: 500)
                
                HStack(spacing: 10){
                    ForEach(0..<self.RelayEditOnBoard.count,id: \.self){i in
                        Circle()
                            .fill(self.index == i ? Color.gray : Color.black.opacity(0.07))
                            .frame(width: 10, height: 10)
                    }
                }
                .padding(.top,10)
                
                Text(self.RelayEditOnBoard[self.index].title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(self.RelayEditOnBoard[self.index].detail)
                    .foregroundColor(.black)
                    .padding(.top)
                    .padding(.horizontal, 20)
                
                Spacer(minLength: 0)
                
                Button(action: {
                    if self.index < self.RelayEditOnBoard.count - 1{
                        self.index += 1
                    }
                    
                }) {
                    
                    HStack(spacing: 10){
                        
                        if self.index == self.RelayEditOnBoard.count - 1{
                            Button(action: {
                                UserDefaults.standard.set(false, forKey: "firststatus")
                                
                                self.RelayApplicationEditSelected.toggle()
                            }){
                                Text("戻る")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }
                        }
                        
                        Text(self.index == self.RelayEditOnBoard.count - 1 ? "" : "次へ")
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


struct RelayAnswerApplicationEdit_Previews: PreviewProvider {
    static var previews: some View {
        RelayAnswerApplicationEdit(RelayApplicationEditSelected: .constant(false))
    }
}
