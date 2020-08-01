//
//  ManagerTopView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/28.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct ManagerTopView: View {
    @State var show = false
    @State var firstPass = ""
    @State var secondPass = ""
    @State var color = Color.black.opacity(0.7)

    var body: some View {
        VStack(spacing:10){
            Text("大会関係者専用ページ")
                .foregroundColor(Color("green1"))
                .fontWeight(.heavy)
                .font(.title)

            Text("・大会関係者の方は指定されたパスワードを入力して下さい。")
                .fontWeight(.heavy)
                .foregroundColor(Color("green1"))
            
            TextField("1つ目のパスワードを入力して下さい", text: $firstPass)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.firstPass != "" ? Color("green1") : self.color,lineWidth:  2))
                        
            TextField("2つ目のパスワードを入力して下さい", text: $secondPass)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.secondPass != "" ? Color("green1") : self.color,lineWidth:  2))
                 
    if self.firstPass == "AAA" && self.secondPass == "BBB"{
        Button(action: {
                    self.show.toggle()
                        } ){

            Text("運営関係者ページに移動する")
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 30)
                .sheet(isPresented: $show){
                        ManagerView()
                            }
                        }.background(Color("green1"))
                        .cornerRadius(10)
                        
                        .foregroundColor(.white)
                }
            }.frame(width: 300, height: 600)
            .lineSpacing(1)
    }
}

struct ManagerTopView_Previews: PreviewProvider {
    static var previews: some View {
        ManagerTopView()
    }
}
