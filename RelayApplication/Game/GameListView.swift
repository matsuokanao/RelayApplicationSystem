//
//  GameListView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/31.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct GameListView: View {
    @ObservedObject var data = getGameCompleteList()
    @State var email = ""
    @State var pass =   ""
    @State var show = false
    
    var body: some View {
         ZStack{
               Color("blue2")
                   .edgesIgnoringSafeArea(.all)
            ScrollView{
               VStack(alignment: .leading){
                Text("試合申し込みリスト")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                HStack{
                                Spacer()
                    Button(action: {
                            self.show.toggle()
                                }) {
                        Text("終了した試合一覧")
                            .fontWeight(.bold)
                            .foregroundColor(Color("blue2"))
                            .padding(.vertical)
                            .padding(.horizontal,10)
                            .background(Color.white)
                            .clipShape(Capsule())
                                    }.padding(.top,20)
                    .sheet(isPresented: self.$show) {
                            GameEndView()
                        }
                }

            Text("試合申し込み時に入力したユーザーパスとメールアドレスを入力して下さい")
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                .padding(.top,20)
                

        Text("メールアドレス")
            .foregroundColor(Color.white)
            .fontWeight(.bold)
            .padding(.top,20)

        TextField("メールアドレス", text: self.$email)
            .keyboardType(.numberPad)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .background(Color("blue2"))
                
                Text("ユーザーパス")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .padding(.top,20)

                TextField("ユーザーパス", text: self.$pass)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("blue2"))

                ForEach(self.data.data,id: \.id){i in
                    CellGameListView(completedata: i, pass: self.pass, email: self.email)
                    }
                }
            }.frame(width: 300, height: 600)
        }
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}


 struct CellGameListView: View {
    var completedata : gamecomplete
    var pass : String
    var email : String
    @State var show = false
     var body: some View {
         VStack{
            if completedata.email == email && completedata.userpass ==  pass && completedata.end == "false"{
                        HStack {
                            Image(systemName: "person.fill")
                                .foregroundColor(Color.white)
                            Text(completedata.gamename)
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                                        Spacer()
                            Button(action: {
                                    self.show.toggle()
                                                }) {
                            Image(systemName: "play.fill")
                                .foregroundColor(Color.white)
                                            }.sheet(isPresented: self.$show) {

                                                    GameShowListView(completedata: self.completedata)
                        
                    }
                }.padding(.top,20)
            }
        }
    }
 }

struct GameShowListView: View {
   var completedata : gamecomplete
    @State var showAlert = false
    var name = "end"
    var edit = "true"
    var body: some View {
        VStack{
        VStack{
                    Text(completedata.gamename)

                       .fontWeight(.bold)
                       .foregroundColor(.white)
                   }.frame(width:500,height: 100)
                       .background(Color("blue2"))
    ScrollView{
        VStack{
            HStack{
                Spacer()
                Button("終了した試合ですか？") {
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
                             db.collection("gamecomplete")
                                 .document(self.completedata.id)
                                 .updateData([self.name: self.edit])
                                     { (err) in
                                 if err != nil{
                                     print((err?.localizedDescription)!)
                                         return
                                         }
                                     }
                         
                         }))}// 破壊的変更用
            }
            Group{
    
            Text("開催都道府県")
                .padding(.top,10)
            Text(completedata.place)
            Text("試合会場")
                .padding(.top,10)
            Text(completedata.gamevenue)
            Text("名前")
                .padding(.top,10)
            Text(completedata.username)
            Text("登録陸連")
                .padding(.top,10)
            Text(completedata.jaaf)
            }
            Text("所属名")
                .padding(.top,10)
            Text(completedata.belong)
            Text("参加種目")
                .padding(.top,10)
            Text(completedata.event1)
            Text(completedata.event2)
            Text(completedata.event3)
            if completedata.pay == "true" {
                Text("試合費用の確認ができました。")
                    .foregroundColor(.red)
                    .fontWeight(.bold)
                    .padding(.top,10)
                            } else{
                Text("試合費用のお支払いが完了していません。")
                    .foregroundColor(.red)
                    .fontWeight(.bold)
                    .padding(.top,10)
                Text("お支払いが確認できない場合は自動キャンセルとなります。")
                    .foregroundColor(.red)
                    .fontWeight(.bold)
                    .padding(.top,20)

        
                    }
                }
            }
        }.frame(width: 300, height: 600)
    }
}
