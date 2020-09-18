//
//  GameApplicationView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/09/18.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import WebKit
import Firebase
import Foundation

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
                    
                    Text("参加したい試合の都道府県を入力して下さい  （例　東京都　大阪府）")
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
    @State var event1 = ""
    @State var event2 = ""
    @State var event3 = ""
    @State var userpass = ""
    @State var email = ""
    @State var title = ""
    @State var message = ""
    @State var dismissButton = ""
    @State var sex = ""
    @State var shows = false
    @State var showAlert = false
    @State var eventAlert = false
    @State var linkshow = false
    
    
    var body: some View {
        ZStack{
            Color("blue1")
                .edgesIgnoringSafeArea(.all)
            //画面スクロール処理
            ScrollView{
                
                VStack{
                    
                    WebView(loadUrl: self.gamedata.png).frame(height: 400)
                    
                    Button(action: {
                        self.linkshow.toggle()
                    }) {
                        Text("大会ホームページを開く")
                            .fontWeight(.bold)
                            .foregroundColor(Color("blue1"))
                            .padding(.vertical)
                            .padding(.horizontal,25)
                            .background(Color.white)
                            .clipShape(Capsule())
                    }.padding(.top,20)
                        .sheet(isPresented: self.$linkshow) {
                            WebViewLink(gamedata: self.gamedata.link)
                    }
                    Group{
                        HStack{
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundColor(Color.white)
                            Text("競技種目、種目数は試合要項を確認しご記入下さい。下の試合表の指示通りに種目を記入して下さい。")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.top,10)
                        }
                        Button(action: {
                            self.eventAlert.toggle()
                        }){
                            Text("試合表を参照する")
                                .fontWeight(.bold)
                                .foregroundColor(Color("blue1"))
                                .padding(.vertical)
                                .padding(.horizontal,45)
                                .background(Color.white)
                                .clipShape(Capsule())
                                
                                .sheet(isPresented: $eventAlert){
                                    EventListView()
                            }
                        }
                        
                        Text("性別（男子か女子で入力して下さい）")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top,10)
                        
                        VStack{
                            TextField("男子　女子", text: $sex)
                                .foregroundColor(.white)
                            Divider()
                                .background(Color.white)
                        }
                        
                        
                        Text("出場種目1（出場しない種目には「なし」と入力して下さい。）")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top,10)
                        VStack{
                            TextField("出場種目1", text: $event1)
                                .foregroundColor(.white)
                            Divider()
                                .background(Color.white)
                        }
                        
                        Text("出場種目2（出場しない種目には「なし」と入力して下さい。）")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top,10)
                        VStack{
                            TextField("出場種目2", text: $event2)
                                .foregroundColor(.white)
                            Divider()
                                .background(Color.white)
                        }
                        
                        Text("出場種目３（出場しない種目には「なし」と入力して下さい。）")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top,10)
                        VStack{
                            TextField("出場種目３", text: $event3)
                                .foregroundColor(.white)
                            Divider()
                                .background(Color.white)
                        }
                    }
                    Group{
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
                            if self.event1 == "" || self.event2 == "" || self.event3 == "" || self.userpass == "" || self.email == "" {
                                self.showAlert.toggle()
                                self.title = "エラー"
                                self.message = "全ての項目を入力して下さい。"
                                self.dismissButton = "OK"
                            }else if self.sex != "男" || self.sex != "女" {
                                self.showAlert.toggle()
                                self.title = "エラー"
                                self.message = "男か女で入力して下さい"
                                self.dismissButton = "OK"
                                
                            }else if self.event1 != "100m" && self.event1 != "200m" && self.event1 != "400m" && self.event1 != "ハードル走" && self.event1 != "走り幅跳び" && self.event1 != "砲丸投げ" && self.event1 != "走り高跳び" && self.event1 != "なし" {
                                self.showAlert.toggle()
                                self.title = "エラー"
                                self.message = "種目表通りに種目をご記入下さい。"
                                self.dismissButton = "OK"
                                
                            }else if self.event2 != "100m" && self.event2 != "200m" && self.event2 != "400m" && self.event2 != "ハードル走" && self.event2 != "走り幅跳び" && self.event2 != "砲丸投げ" && self.event2 != "走り高跳び" && self.event2 != "なし"{
                                self.showAlert.toggle()
                                self.title = "エラー"
                                self.message = "種目表通りに種目をご記入下さい。"
                                self.dismissButton = "OK"
                                
                            }else if self.event3 != "100m" && self.event3 != "200m" && self.event3 != "400m" && self.event3 != "ハードル走" && self.event3 != "走り幅跳び" && self.event3 != "砲丸投げ" && self.event3 != "走り高跳び" && self.event3 != "なし" {
                                self.showAlert.toggle()
                                self.title = "エラー"
                                self.message = "種目表通りに種目をご記入下さい。"
                                self.dismissButton = "OK"
                                
                            }else{
                                self.shows.toggle()
                            }
                        }){
                            Text("確認する")
                                .fontWeight(.bold)
                                .foregroundColor(Color("blue1"))
                                .padding(.vertical)
                                .padding(.horizontal,45)
                                .background(Color.white)
                                .clipShape(Capsule())
                                
                                .sheet(isPresented: $shows){
                                    ConfirmationView(event1: self.event1, event2: self.event2, event3: self.event3, userpass: self.userpass, email: self.email, sex: self.sex, gamedata: self.gamedata)
                                    
                            }
                        }.alert(isPresented: $showAlert){
                            Alert(title: Text(self.title),
                                  message: Text(self.message),
                                  dismissButton: .default(Text(self.dismissButton)))
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
    var sex : String
    var gamedata : gamelist
    
    
    @ObservedObject var userdata = getUserdataList()
    
    var body: some View {
        VStack{
            Text("確認リストが表示されない場合されない場合は、エントリーパス、メールアドレスが間違っている可能性があります。前のページに戻り再度ご確認下さい。")
                .foregroundColor(.red)
                .fontWeight(.bold)
                .padding(.top,30)
            ForEach(self.userdata.data,id: \.id){i in
                
                CellConfirmationView(event1: self.event1, event2: self.event2, event3: self.event3, userpass: self.userpass, email: self.email, sex: self.sex, gamelist: self.gamedata, userlist: i)
                
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
    var sex : String
    var gamelist : gamelist
    var userlist : userlist
    @State var show = false
    @State var pay = "false"
    @State var end = "false"
    
    var body: some View {
        
        VStack{
            if userlist.userpass == userpass && userlist.email == email{
                ScrollView{
                    Group{
                        Text("試合名")
                            .padding(.top,10)
                        Text(gamelist.gamename)
                        Text("開催都道府県")
                            .padding(.top,10)
                        Text(gamelist.place)
                        Text("試合会場")
                            .padding(.top,10)
                        Text(gamelist.gamevenue)
                        Text("名前")
                            .padding(.top,10)
                        Text(userlist.username)
                        Text("登録陸連")
                            .padding(.top,10)
                        Text(userlist.jaaf)
                    }
                    Text("所属名")
                        .padding(.top,10)
                    Text(userlist.belong)
                    Text("参加種目")
                        .padding(.top,10)
                    Text(event1)
                    Text(event2)
                    Text(event3)
                    
                    HStack{
                        Spacer()
                        Button(action: {
                            self.show.toggle()
                            let db = Firestore.firestore()
                            let data: [String : Any] = ["event1": self.event1, "event2": self.event2, "event3": self.event3, "userpass": self.userlist.userpass, "email": self.userlist.email, "pay": self.pay,"gamename":self.gamelist.gamename,"year":self.gamelist.year,"month":self.gamelist.month,"day":self.gamelist.day,"place":self.gamelist.place,"gamevenue":self.gamelist.gamevenue,"groupnum":self.gamelist.groupnum,"groupname":self.gamelist.groupname,"grouppass": self.gamelist.grouppass,"jaaf":self.userlist.jaaf,"belong":self.userlist.belong,"phonenumber":self.userlist.phonenumber,"ceo":self.userlist.ceo,"username":self.userlist.username,"end":self.end,"sex":self.sex]
                            //試合申し込み完了テーブルに入れる
                            db.collection("gamecomplete")
                                .addDocument(data:data)
                                { (err) in
                                    if err != nil{
                                        return
                                    }
                            }
                        }){
                            Text("申込み")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .padding(.vertical)
                                .padding(.horizontal,45)
                                .background(Color.red)
                                .clipShape(Capsule())
                                .sheet(isPresented: $show){
                                    GameApplicationFinishView()
                                    
                            }
                        }.padding(.top,20)
                        Spacer()
                    }
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


struct WebViewLink : UIViewRepresentable {
    
    var gamedata: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.gamedata)else{
            return WKWebView()
        }
        let request = URLRequest(url: url)
        let wkWebview = WKWebView()
        wkWebview.load(request)
        return wkWebview
    }
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebViewLink>) {
        
    }
}
