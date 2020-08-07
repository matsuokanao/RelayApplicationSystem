//
//  ManagerEndView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/05.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct ManagerEndView: View {
    @ObservedObject var gamedata = getGamedataList()
       @State var pass = ""
       @State var num = ""
       var body: some View {
           ZStack{
            Color(.white)
                   .edgesIgnoringSafeArea(.all)
               VStack(alignment: .leading){
                   ScrollView{
                   Text("試合を終了させる")
                       .font(.title)
                       .fontWeight(.bold)
                       .foregroundColor(Color("green6"))

                       Text("終了させたい試合の運営団体番号と運営団体パスワードを入力して下さい。削除した試合は「試合情報を閲覧、編集する」ページにて確認できます。")
                           .foregroundColor(Color("green6"))
                           .fontWeight(.bold)
                           .padding(.top,20)

                       Text("運営団体番号")
                           .foregroundColor(Color("green6"))
                           .fontWeight(.bold)
                           .padding(.top,20)

                                      
                       TextField("", text: self.$num)
                           .keyboardType(.numberPad)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                           .background(Color("green6"))
                   
                       Text("運営団パスワード")
                        .foregroundColor(Color("green6"))
                        .fontWeight(.bold)

                                      
                       TextField("", text: self.$pass)
                           .keyboardType(.numberPad)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                           .background(Color("green6"))

                               ForEach(self.gamedata.data,id: \.id){i in
                                   CellManagerEndViewView(gamedata:i,pass: self.pass, num: self.num)
                               }
                           }
                       }.frame(width: 300, height: 500)
                   }
               }
           }

struct ManagerEndView_Previews: PreviewProvider {
    static var previews: some View {
        ManagerEndView()
    }
}

struct CellManagerEndViewView: View {
    @ObservedObject var completelist = getGameCompleteList()
    var gamedata : gamelist
    var pass : String
    var num : String
    var name = "end"
    var edit = "true"
    @State var showAlert = false
    var body: some View {
        VStack{
            if gamedata.grouppass == pass && gamedata.groupnum == num && gamedata.end == "false"{
                HStack {
                        Image(systemName: "person.fill")
                                .foregroundColor(Color("green6"))
                        Text(gamedata.gamename)
                                .fontWeight(.bold)
                                .foregroundColor(Color("green6"))
                                .padding(.top,10)

                    Spacer()
                        Button("試合を終了させる") {
                                    self.showAlert.toggle()
                                    }
                            .alert(isPresented: $showAlert) {
                                Alert(title: Text("警告"),
                                        message: Text("試合が終了されますがよろしいですか？"),
                                            primaryButton: .cancel(Text("キャンセル")), // キャンセル用
                                                    secondaryButton: .destructive(Text("終了"),
                                                        action:{
                                                            
                           let db = Firestore.firestore()
                                //試合申し込み完了テーブルに入れる
                            db.collection("gamelist")
                                .document(self.gamedata.gamename)
                                .updateData([self.name: self.edit])
                                    { (err) in
                                if err != nil{
                                    print((err?.localizedDescription)!)
                                        return
                                        }
                                    }
                        
                        }))}// 破壊的変更用
                }
            }
        }
    }
}

