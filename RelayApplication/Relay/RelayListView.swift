//
//  RelayListView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/02.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct RelayListView: View {
    @ObservedObject var data = getRelayCompleteList()
    @State var email = ""
    @State var pass =   ""
    @State var show = false
    var body: some View {
        ZStack{
                Color("yello3")
                        .edgesIgnoringSafeArea(.all)
        VStack(alignment: .leading){
            ScrollView{
            Text("リレー申込みリスト")
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
                            .foregroundColor(Color("yello3"))
                            .padding(.vertical)
                            .padding(.horizontal,10)
                            .background(Color.white)
                            .clipShape(Capsule())
                                    }.padding(.top,20)
                    .sheet(isPresented: self.$show) {
                            RelayEndView()
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
                    .background(Color("yello3"))
                        
            Text("ユーザーパス")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .padding(.top,20)

            TextField("ユーザーパス", text: self.$pass)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .background(Color("yello3"))

        ForEach(self.data.data,id: \.id){i in
            CellRelayListView(relaylist: i, pass: self.pass, email: self.email)
                        }
                    }.frame(width: 300, height: 600)
                }
            }
        }
}

struct RelayListView_Previews: PreviewProvider {
    static var previews: some View {
        RelayListView()
    }
}



struct CellRelayListView: View {
    var relaylist : relaycomplete
    var pass : String
    var email : String
    @State var show = false
    var body: some View {
        VStack{
        if relaylist.email == email && relaylist.userpass == pass  {
            HStack {
                Image(systemName: "person.fill")
                        .foregroundColor(Color.white)
                Text(relaylist.gamename)
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                                        Spacer()
            Button(action: {
                            self.show.toggle()
                                    }) {
                Image(systemName: "play.fill")
                        .foregroundColor(Color.white)
                        }.sheet(isPresented: self.$show) {

                            RelayShowListView(relaylist: self.relaylist)
                                   
                               }
                           }.padding(.top,20)
                       }
                   }
               }
            }


struct RelayShowListView: View {
   var relaylist : relaycomplete
    @State var show = false
    @State var showAlert = false
    var name = "end"
    var edit = "true"
    
        
    var body: some View {
        VStack{
            VStack{
                          Text(relaylist.gamename)
                              .fontWeight(.bold)
                              .foregroundColor(.white)
                                  }.frame(width:500,height: 100)
                                  .background(Color("yello3"))
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
                                 .document(self.relaylist.id)
                                 .updateData([self.name: self.edit])
                                     { (err) in
                                 if err != nil{
                                     print((err?.localizedDescription)!)
                                         return
                                         }
                                     }
                         
                         }))}// 破壊的変更用
            }.padding(.top,20)

          
        
            ScrollView{

            Group{
            Text("開催都道府県")
                .padding(.top,10)
            Text(relaylist.place)
            Text("試合会場")
                .padding(.top,10)
            Text(relaylist.gamevenue)
            
            Text("登録陸連")
                .padding(.top,10)
            Text(relaylist.jaaf)
            }
            Text("所属名")
                .padding(.top,10)
            Text(relaylist.belong)
            Text("参加種目")
                .padding(.top,10)
            Text(relaylist.event)
    Group{
            Text("メンバー")
                .padding(.top,10)
            Text(relaylist.member1)
            Text(relaylist.member2)
            Text(relaylist.member3)
            Text(relaylist.member4)
            Text(relaylist.member5)
            Text(relaylist.member6)
                }
            
            if relaylist.pay == "true" {
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
        }.frame(width: 300, height: 600)
    }
}
