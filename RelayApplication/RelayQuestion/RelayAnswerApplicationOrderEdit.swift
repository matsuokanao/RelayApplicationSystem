//
//  RelayAnswerApplicationOrderEdit.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/09.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct RelayAnswerApplicationOrderEdit: View {
    @State var RelayOrderOnBoard = [Board(title: "オーダー表の不備",
                                          detail:"提出後のオーダー表の内容を変更することはできません。提出時に不備が無いよう注意してご記入下さい。",
                                          pic: "relay15"),
                                    
    ]
    
    @State var index = 0
    @Binding var RelayOrderEditSelected: Bool
    
    var body: some View {
        VStack{
            ScrollView{
                Image(self.RelayOrderOnBoard[self.index].pic)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: 500)
                
                HStack(spacing: 10){
                    ForEach(0..<self.RelayOrderOnBoard.count,id: \.self){i in
                        Circle()
                            .fill(self.index == i ? Color.gray : Color.black.opacity(0.07))
                            .frame(width: 10, height: 10)
                    }
                }
                .padding(.top,10)
                
                Text(self.RelayOrderOnBoard[self.index].title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(self.RelayOrderOnBoard[self.index].detail)
                    .foregroundColor(.black)
                    .padding(.top)
                    .padding(.horizontal, 20)
                
                Spacer(minLength: 0)
                
                Button(action: {
                    if self.index < self.RelayOrderOnBoard.count - 1{
                        self.index += 1
                    }
                    
                }) {
                    
                    HStack(spacing: 10){
                        
                        if self.index == self.RelayOrderOnBoard.count - 1{
                            Button(action: {
                                UserDefaults.standard.set(false, forKey: "firststatus")
                                
                                self.RelayOrderEditSelected.toggle()
                            }){
                                Text("戻る")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }
                        }
                        
                        Text(self.index == self.RelayOrderOnBoard.count - 1 ? "" : "次へ")
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


struct RelayAnswerApplicationOrderEdit_Previews: PreviewProvider {
    static var previews: some View {
        RelayAnswerApplicationOrderEdit(RelayOrderEditSelected: .constant(false))
    }
}
