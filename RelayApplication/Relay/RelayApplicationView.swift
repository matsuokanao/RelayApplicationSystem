//
//  RelayApplicationView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/02.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct RelayApplicationView: View {
    @ObservedObject var gamedata = getGamedataList()
    @State var place = ""
    var body: some View {
        ZStack{
                Color("yello1")
                    .edgesIgnoringSafeArea(.all)

                VStack(alignment: .leading){
                    ScrollView(.vertical){
                    Text("参加したい試合の都道府県を入力して下さい")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                
                    TextField("", text: self.$place)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .background(Color("yello1"))
                   
                        ForEach(self.gamedata.data,id: \.id){i in

                            CellRelayApplicationView(gamedata: i, place: self.place)
                            }.padding(.top,20)
                        }.frame(width: 300, height: 600)
                    }
                }
            }
        }

struct RelayApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        RelayApplicationView()
    }
}



struct CellRelayApplicationView: View {
    var gamedata : gamelist
    var place : String
    @State var show = false
    var body: some View {
        VStack{
            if gamedata.place == self.place && gamedata.relay == "はい"{
                    VStack{
                                WebView(loadUrl: self.gamedata.png).frame(height: 400)
                        HStack{
                            VStack(alignment: .leading){
                                Text(gamedata.gamename).fontWeight(.heavy).font(.body)

                                    Text(gamedata.place).fontWeight(.heavy).font(.body)
                                
                                        }
                                        Spacer()
                                        Button(action: {
                                    self.show.toggle()
                                        }) {
                                                        
                                Image(systemName: "arrow.right")
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .padding(14)
                                                    
                                }.background(Color("yello1"))
                                    .clipShape(Circle())
                                                    
                                }.padding(.horizontal)
                                    .padding(.bottom,6)
                                                    
                                }.background(Color.white)
                                .cornerRadius(20)
                                .sheet(isPresented: self.$show) {
                                  Spacer()
                                    RelayApplicationListView(gamedata: self.gamedata)
                        }
                    }
                }
            }
        }



struct RelayApplicationListView: View {
var gamedata : gamelist
    @State var shows = false
    @State var manber1 = ""
    @State var manber2 = ""
    @State var manber3 = ""
    @State var manber4 = ""
    @State var manber5 = ""
    @State var manber6 = ""
    @State var userpass = ""
    @State var email = ""
    var body: some View {
        ZStack{
            Color("yello1")
                .edgesIgnoringSafeArea(.all)
                //画面スクロール処理
                ScrollView(.vertical){
                    
                VStack(alignment: .leading, spacing: 25){
                    WebView(loadUrl: self.gamedata.png).frame(height: 400)
                    
                    Text("・所属団体パスワード,試合パスワードの詳しい説明に関しましてはHOME画面の良くある質問をご参照下さい")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Group{
                    Text("メンバー1")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top,10)
                    VStack{
                        TextField("出場種目1", text: $manber1)
                            .foregroundColor(.white)
                            Divider()
                                .background(Color.white)
                            }
                    
                    Text("メンバー2")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top,10)
                    VStack{
                        TextField("出場種目2", text: $manber2)
                            .foregroundColor(.white)
                            Divider()
                                .background(Color.white)
                            }
                    
                    Text("メンバー３")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top,10)
                    VStack{
                        TextField("出場種目３", text: $manber3)
                            .foregroundColor(.white)
                            Divider()
                                .background(Color.white)
                            }
                    Text("メンバー4")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top,10)
                    VStack{
                        TextField("出場種目３", text: $manber4)
                            .foregroundColor(.white)
                            Divider()
                                .background(Color.white)
                            }
                    }
                    Group{
                    Text("メンバー5")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top,10)
                    VStack{
                        TextField("出場種目３", text: $manber5)
                            .foregroundColor(.white)
                            Divider()
                                .background(Color.white)
                            }

                    Text("メンバー6")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top,10)
                    VStack{
                        TextField("出場種目３", text: $manber6)
                            .foregroundColor(.white)
                            Divider()
                                .background(Color.white)
                            }
                    
                    
                    Text("ユーザーパス")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top,10)
                    VStack{
                        TextField("ユーザーパス", text: $userpass)
                            .foregroundColor(.white)
                            Divider()
                                .background(Color.white)
                            }
                        
                    Text("メールアドレス")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top,10)
                    VStack{
                        TextField("メールアドレス", text: $email)
                            .foregroundColor(.white)
                            Divider()
                                .background(Color.white)
                        }
                    }
                    HStack{
                            Spacer()
                        Button(action: {
                            self.shows.toggle()
                        }){
                            Text("確認する")
                                .fontWeight(.bold)
                                .foregroundColor(Color("yello1"))
                                .padding(.vertical)
                                .padding(.horizontal,45)
                                .background(Color.white)
                                .clipShape(Capsule())
                                
                            .sheet(isPresented: $shows){
                                UserView(manber1: self.manber1, manber2: self.manber2, manber3: self.manber3,manber4: self.manber4,manber5: self.manber5,manber6: self.manber6, userpass: self.userpass, email: self.email, gamedata: self.gamedata)
                        
                                        }
                                    }
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }


struct UserView: View {
    var manber1 :String
    var manber2 :String
    var manber3 :String
    var manber4 :String
    var manber5 :String
    var manber6 :String
    var userpass :String
    var email :String
    var gamedata : gamelist
    
  @ObservedObject var userdata = getUserdataList()
    
    var body: some View {
        VStack{
                ForEach(self.userdata.data,id: \.id){i in
                    CellUserView(manber1: self.manber1, manber2: self.manber2, manber3: self.manber3,manber4: self.manber4,manber5: self.manber5,manber6: self.manber6, userpass: self.userpass, email: self.email, gamelist: self.gamedata, userlist: i)
                
            }
        }
    }
}


struct CellUserView: View {
    var manber1 :String
    var manber2 :String
    var manber3 :String
    var manber4 :String
    var manber5 :String
    var manber6 :String
    var userpass :String
    var email :String
    var gamelist : gamelist
    var userlist : userlist
    @State var show = false
    @State var pay = "false"

    
    var body: some View {
        VStack{
           if userlist.userpass == userpass && userlist.email == email{
                Group{
                Text("試合名")
                Text(gamelist.gamename)
                Text("開催都道府県")
                Text(gamelist.place)
                Text("試合会場")
                Text(gamelist.gamevenue)
                Text("名前")
                Text(userlist.username)
                Text("登録陸連")
                Text(userlist.jaaf)
                }
            Group{
                Text("所属名")
                Text(userlist.belong)
                Text("参加種目")
                Text(manber1)
                Text(manber2)
                Text(manber3)
                Text(manber4)
                Text(manber5)
                Text(manber6)
            }

                HStack{
                    Spacer()
                Button(action: {
                    self.show.toggle()
                    let db = Firestore.firestore()
                    let data: [String : Any] = ["manber1": self.manber1, "manber2": self.manber2, "manber3": self.manber3, "manber4": self.manber4, "manber5": self.manber5, "manber6": self.manber6, "userpass": self.userlist.userpass, "email": self.userlist.email, "pay": self.pay,"gamename":self.gamelist.gamename,"year":self.gamelist.year,"month":self.gamelist.month,"day":self.gamelist.day,"place":self.gamelist.place,"gamevenue":self.gamelist.gamevenue,"groupnum":self.gamelist.groupnum,"groupname":self.gamelist.groupname,"grouppass": self.gamelist.grouppass,"jaaf":self.userlist.jaaf,"belong":self.userlist.belong,"phonenumber":self.userlist.phonenumber,"ceo":self.userlist.ceo,"username":self.userlist.username]
                    //試合申し込み完了テーブルに入れる
                    db.collection("relaycomplete")
                       .addDocument(data:data)
                            { (err) in
                                if err != nil{
                                        return
                            }
                        }
                }){
                    Text("完了")
                        .fontWeight(.bold)
                        .foregroundColor(Color("blue1"))
                        .padding(.vertical)
                        .padding(.horizontal,45)
                        .background(Color.white)
                        .clipShape(Capsule())
                        
                    .sheet(isPresented: $show){
                        RelayApplicationFinishView()
                
                            }
                        }
                    Spacer()
                }
            }
        }
    }
}


