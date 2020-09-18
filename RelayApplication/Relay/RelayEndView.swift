//
//  RelayEndView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/05.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct RelayEndView: View {
    
    @ObservedObject var data = getRelayCompleteList()
    @State var email = ""
    @State var pass =   ""
    @State var show = false
    
    var body: some View {
        ZStack{
            Color(.white)
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack(alignment: .leading){
                    Text("終了した試合リスト")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("yello3"))
                    
                    Text("試合申し込み時に入力したユーザーパスとメールアドレスを入力して下さい")
                        .foregroundColor(Color("yello3"))
                        .fontWeight(.bold)
                        .padding(.top,20)
                    
                    
                    Text("メールアドレス")
                        .foregroundColor(Color("yello3"))
                        .fontWeight(.bold)
                        .padding(.top,20)
                    
                    TextField("メールアドレス", text: self.$email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(Color("yello3"))
                    
                    Text("ユーザーパス")
                        .foregroundColor(Color("yello3"))
                        .fontWeight(.bold)
                        .padding(.top,20)
                    
                    TextField("ユーザーパス", text: self.$pass)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(Color("yello3"))
                    
                    ForEach(self.data.data,id: \.id){i in
                        CellRelayEndView(relaydata: i, pass: self.pass, email: self.email)
                    }
                }
            }.frame(width: 300, height: 600)
        }
    }
}

struct RelayEndView_Previews: PreviewProvider {
    static var previews: some View {
        RelayEndView()
    }
}

struct CellRelayEndView: View {
    @ObservedObject var gamedata  = getGamedataList()
    var relaydata : relaycomplete
    var pass : String
    var email : String
    @State var show = false
    var body: some View {
        VStack{
            if relaydata.email == email && relaydata.userpass ==  pass {
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(Color("yello3"))
                    Text(relaydata.gamename)
                        .foregroundColor(Color("yello3"))
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Image(systemName: "play.fill")
                            .foregroundColor(Color("yello3"))
                    }.sheet(isPresented: self.$show) {
                        ForEach(self.gamedata.data,id: \.id){i in
                            RelayEndShowView(relaydata: self.relaydata,gamedata: i)
                            
                        }
                    }.padding(.top,20)
                }
            }
        }
    }
    
    struct RelayEndShowView: View {
        var relaydata : relaycomplete
        var gamedata : gamelist
        @State var linkshow = false
        var name = "end"
        var edit = "true"
        var body: some View {
            VStack{
                if gamedata.gamename == relaydata.gamename && relaydata.end == "true"{
                    VStack{
                        Text(relaydata.gamename)
                            
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }.frame(width:500,height: 100)
                        .background(Color("yello3"))
                    ScrollView{
                        VStack{
                            VStack(alignment: .leading, spacing: 25){
                                
                                WebView(loadUrl: self.gamedata.png).frame(width: 300, height: 400)
                            }
                            Button(action: {
                                self.linkshow.toggle()
                            }) {
                                Text("大会ホームページを開く")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("yello3"))
                                    .padding(.vertical)
                                    .padding(.horizontal,25)
                                    .background(Color.white)
                                    .clipShape(Capsule())
                            }.padding(.top,20)
                                .sheet(isPresented: self.$linkshow) {
                                    WebViewLink(gamedata: self.gamedata.link)
                            }
                            
                            Group{
                                
                                Text("開催都道府県")
                                    .padding(.top,10)
                                Text(relaydata.place)
                                Text("試合会場")
                                    .padding(.top,10)
                                Text(relaydata.gamevenue)
                                Text("名前")
                                    .padding(.top,10)
                                Text(relaydata.username)
                                Text("登録陸連")
                                    .padding(.top,10)
                                Text(relaydata.jaaf)
                            }
                            Text("所属名")
                                .padding(.top,10)
                            Text(relaydata.belong)
                            Text("種目")
                                .padding(.top,10)
                            Text(relaydata.event)
                            Group{
                                Text("参加者")
                                Text(relaydata.member1)
                                Text(relaydata.member2)
                                Text(relaydata.member3)
                                Text(relaydata.member4)
                                Text(relaydata.member5)
                                Text(relaydata.member6)
                            }
                        }
                    }
                }
            }
        }
    }
}
