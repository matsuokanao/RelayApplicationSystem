//
//  GameEndView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/05.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct GameEndView: View {
    @ObservedObject var data = getGameCompleteList()
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
                        .foregroundColor(Color("blue2"))
                    
                    Text("試合申し込み時に入力したユーザーパスとメールアドレスを入力して下さい")
                        .foregroundColor(Color("blue2"))
                        .fontWeight(.bold)
                        .padding(.top,20)
                    
                    
                    Text("メールアドレス")
                        .foregroundColor(Color("blue2"))
                        .fontWeight(.bold)
                        .padding(.top,20)
                    
                    TextField("メールアドレス", text: self.$email)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(Color("blue2"))
                    
                    Text("ユーザーパス")
                        .foregroundColor(Color("blue2"))
                        .fontWeight(.bold)
                        .padding(.top,20)
                    
                    TextField("ユーザーパス", text: self.$pass)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(Color("blue2"))
                    
                    ForEach(self.data.data,id: \.id){i in
                        CellGameEndViewView(completedata: i, pass: self.pass, email: self.email)
                    }
                }
            }.frame(width: 300, height: 600)
        }
    }
}

struct GameEndView_Previews: PreviewProvider {
    static var previews: some View {
        GameEndView()
    }
}

struct CellGameEndViewView: View {
    @ObservedObject var gamedata  = getGamedataList()
    var completedata : gamecomplete
    var pass : String
    var email : String
    @State var show = false
    var body: some View {
        VStack{
            if completedata.email == email && completedata.userpass ==  pass && completedata.end == "true"{
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(Color("blue2"))
                    Text(completedata.gamename)
                        .foregroundColor(Color("blue2"))
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Image(systemName: "play.fill")
                            .foregroundColor(Color("blue2"))
                    }.sheet(isPresented: self.$show) {
                        ForEach(self.gamedata.data,id: \.id){i in
                            GameEndShowView(completedata: self.completedata,gamedata: i)
                            
                        }
                    }.padding(.top,20)
                }
            }
        }
    }
    
    struct GameEndShowView: View {
        var completedata : gamecomplete
        var gamedata : gamelist
        @State var linkshow = false
        
        var name = "end"
        var edit = "true"
        var body: some View {
            VStack{
                if gamedata.gamename == completedata.gamename && completedata.end == "true"{
                    VStack{
                        Text(completedata.gamename)
                            
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }.frame(width:500,height: 100)
                        .background(Color("blue2"))
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
                                    .foregroundColor(Color("blue2"))
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
                        }
                    }
                }
            }
        }
    }
}



