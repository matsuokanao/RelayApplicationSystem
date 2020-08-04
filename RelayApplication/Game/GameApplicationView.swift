//
//  GameApplicationView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/29.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import WebKit
import Firebase

struct GameApplicationView: View {
    @ObservedObject var gamedata  = getGamedataList()
    @State var place = ""
    var body: some View {
            ZStack{
                Color("blue1")
                        .edgesIgnoringSafeArea(.all)

        VStack(alignment: .leading){
            ScrollView{
                Text("試合申し込み")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)

            Text("参加したい試合の都道府県を入力して下さい")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .padding(.top,30)
        
            TextField("", text: self.$place)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("blue1"))
           
                ForEach(self.gamedata.data,id: \.id){i in

                        CellGameApplicationView(gamedata: i, place: self.place)
                        }.padding(.top,20)
                }.frame(width: 300, height: 600)
            }
        }
    }
}

struct GameApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        GameApplicationView()
    }
}


struct CellGameApplicationView: View {
    var gamedata : gamelist
    var place : String
    @State var show = false
var body: some View {
    
        VStack{
            
            if gamedata.place == self.place{
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
                                            
                        }.background(Color("blue1"))
                            .clipShape(Circle())
                                            
                        }.padding(.horizontal)
                            .padding(.bottom,6)
                                            
                        }.background(Color.white)
                        .cornerRadius(20)
                        .sheet(isPresented: self.$show) {
                          Spacer()
                            GameApplicationListView(gamedata: self.gamedata)
                }
            }
        }
    }
}


struct GameApplicationListView: View {
    var gamedata : gamelist
    @State var shows = false
    @State var event1 = ""
    @State var event2 = ""
    @State var event3 = ""
    @State var userpass = ""
    @State var email = ""

    var body: some View {
    ZStack{
        Color("blue1")
            .edgesIgnoringSafeArea(.all)
            //画面スクロール処理
            ScrollView(.vertical){
                
            VStack(alignment: .leading, spacing: 25){
                
                WebView(loadUrl: self.gamedata.png).frame(height: 400)
                
                Text("・所属団体パスワード,試合パスワードの詳しい説明に関しましてはHOME画面の良くある質問をご参照下さい")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Group{
                Text("出場種目1")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top,10)
                VStack{
                    TextField("出場種目1", text: $event1)
                        .foregroundColor(.white)
                        Divider()
                            .background(Color.white)
                        }
                
                Text("出場種目2")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top,10)
                VStack{
                    TextField("出場種目2", text: $event2)
                        .foregroundColor(.white)
                        Divider()
                            .background(Color.white)
                        }
                
                Text("出場種目３")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top,10)
                VStack{
                    TextField("出場種目３", text: $event3)
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
                            .foregroundColor(Color("blue1"))
                            .padding(.vertical)
                            .padding(.horizontal,45)
                            .background(Color.white)
                            .clipShape(Capsule())
                            
                        .sheet(isPresented: $shows){
                            ConfirmationView(event1: self.event1, event2: self.event2, event3: self.event3, userpass: self.userpass, email: self.email, gamedata: self.gamedata)
                    
                                    }
                                }
                                Spacer()
                            }
                        }
                    }
                }
            }
        }

struct ConfirmationView: View {
    var event1 :String
    var event2 :String
    var event3 :String
    var userpass :String
    var email :String
    var gamedata : gamelist
    
  @ObservedObject var userdata = getUserdataList()
    
    var body: some View {
        VStack{
                ForEach(self.userdata.data,id: \.id){i in
                    
                    CellConfirmationView(event1: self.event1, event2: self.event2, event3: self.event3, userpass: self.userpass, email: self.email, gamelist: self.gamedata, userlist: i)
                
            }
        }
    }
}


struct CellConfirmationView: View {
    var event1 :String
    var event2 :String
    var event3 :String
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
                Text("所属名")
                Text(userlist.belong)
                Text("参加種目")
                Text(event1)
                Text(event2)
                Text(event3)

                HStack{
                    Spacer()
                Button(action: {
                    self.show.toggle()
                    let db = Firestore.firestore()
                    let data: [String : Any] = ["event1": self.event1, "event2": self.event2, "event3": self.event3, "userpass": self.userlist.userpass, "email": self.userlist.email, "pay": self.pay,"gamename":self.gamelist.gamename,"year":self.gamelist.year,"month":self.gamelist.month,"day":self.gamelist.day,"place":self.gamelist.place,"gamevenue":self.gamelist.gamevenue,"groupnum":self.gamelist.groupnum,"groupname":self.gamelist.groupname,"grouppass": self.gamelist.grouppass,"jaaf":self.userlist.jaaf,"belong":self.userlist.belong,"phonenumber":self.userlist.phonenumber,"ceo":self.userlist.ceo,"username":self.userlist.username]
                    //試合申し込み完了テーブルに入れる
                    db.collection("gamecomplete")
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
                        GameApplicationFinishView()
                
                                }
                            }
                            Spacer()
                        }
            }
        }
    }
}






//WebKitの設定
struct WebView: UIViewRepresentable {
    var loadUrl:String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: loadUrl)!))
    }
}


    


