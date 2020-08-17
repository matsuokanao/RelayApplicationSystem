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
    @State var answershow = false
    @State var firstPass = ""
    @State var secondPass = ""
    @State var color = Color.black.opacity(0.7)
    @ObservedObject var keyboard = KeyboardObserver()

    var body: some View {
        VStack(spacing:10){
            Image(decorative:"cat4")
                .resizable()    // 画像サイズをフレームサイズに合わせる
            .frame(width: 120, height: 100)
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
            
            HStack{
                Spacer()
            VStack{
                Text("こちらのページから試合の作成、運営を行うことが出来ます。大会関係者専用ページに遷移するためには申し込みが必要です。")
                .foregroundColor(Color("green1"))
                .fontWeight(.heavy)
                
            Button(action: {
            self.answershow.toggle()
                } ){
            Text("申込みをする")
                .fontWeight(.heavy)
                .foregroundColor(.red)
                .sheet(isPresented: $answershow){
                    ManagerFirstCreate()
                            }
                    }
                }
            }
                

                 
    if self.firstPass == "AAA" && self.secondPass == "BBB"{
        Button(action: {
                    self.show.toggle()
                        } ){

            Text("大会関係者ページに移動する")
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 30)
                .sheet(isPresented: $show){
                        ManagerView()
                            }
                        }.background(Color("green1"))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
            }.onAppear{
                self.keyboard.startObserve()
            }.onDisappear{
                self.keyboard.stopObserve()
            }.padding(.bottom, keyboard.keyboardHeight)
            .frame(width: 300, height: 600)
            .lineSpacing(1)
    }
}

struct ManagerTopView_Previews: PreviewProvider {
    static var previews: some View {
        ManagerTopView()
    }
}
