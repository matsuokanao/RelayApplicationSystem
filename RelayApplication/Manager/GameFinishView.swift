//
//  GameFinishView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/05.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct GameFinishView: View {
    @ObservedObject var gamedata = getGamedataList()
    @ObservedObject var keyboard = KeyboardObserver()
    @State var pass = ""
    @State var num = ""
    //日付　年
    @State var year = ""
    //日付　月
    @State var month = ""
    
    
    var body: some View {
        ZStack{
            Color(.white)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                ScrollView{
                    Text("終了した試合一覧")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("green7"))
                    
                    Text("試合の運営団体番号と運営団体パスワードを入力して下さい。試合を終了させたい場合は「試合のエントリーリストを開く」ページを開いて下さい。")
                        .foregroundColor(Color("green7"))
                        .fontWeight(.bold)
                        .padding(.top,20)
                    
                    Text("運営団体番号")
                        .foregroundColor(Color("green7"))
                        .fontWeight(.bold)
                        .padding(.top,20)
                    
                    
                    TextField("", text: self.$num)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(Color("green7"))
                    
                    Text("運営団体パスワード")
                        .foregroundColor(Color("green7"))
                        .fontWeight(.bold)
                    
                    
                    TextField("", text: self.$pass)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(Color("green7"))
                    
                    Text("試合の日付を入力して下さい")
                        .foregroundColor(Color("green7"))
                        .fontWeight(.bold)
                    HStack{
                        TextField("", text: self.$year)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .background(Color("green7"))
                        Text("年")
                            .foregroundColor(Color("green7"))
                            .fontWeight(.bold)
                        
                        
                        TextField("", text: self.$month)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .background(Color("green7"))
                        Text("月")
                            .foregroundColor(Color("green7"))
                            .fontWeight(.bold)
                    }
                    ForEach(self.gamedata.data,id: \.id){i in
                        CellGameFinishView(gamedata:i,pass: self.pass, num: self.num,year: self.year,month:self.month)
                    }
                }
            }.frame(width: 300, height: 500)
                .padding(.top,-70)
        }
    }
}


struct GameFinishView_Previews: PreviewProvider {
    static var previews: some View {
        GameFinishView()
    }
}

struct CellGameFinishView: View {
    
    var gamedata : gamelist
    var pass : String
    var num : String
    var year : String
    var month : String
    var name = "end"
    var edit = "true"
    @State var show = false
    
    var body: some View {
        VStack{
            if gamedata.grouppass == pass && gamedata.groupnum == num && gamedata.end == "true"
                && gamedata.year == year && gamedata.month == month{
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(Color("green7"))
                    Text(gamedata.gamename)
                        .fontWeight(.bold)
                        .foregroundColor(Color("green7"))
                        .padding(.top,10)
                    Spacer()
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Image(systemName: "play.fill")
                            .foregroundColor(Color("green7"))
                    }.sheet(isPresented: self.$show) {
                        GameFinishShowView(gamedata: self.gamedata)
                        
                    }
                }
            }
        }
    }
}


struct GameFinishShowView: View {
    
    var gamedata : gamelist
    @State var linkshow = false
    
    var body: some View {
        VStack{
            VStack{
                Text(gamedata.gamename)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }.frame(width:500,height: 100)
                .foregroundColor(Color("green7"))
            ScrollView{
                VStack{
                    VStack(alignment: .leading, spacing: 25){
                        
                        WebView(loadUrl: self.gamedata.png).frame(height: 400)
                    }
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
                    
                    Text("試合日程")
                        .padding(.top,10)
                    HStack{
                        Text(gamedata.year)
                        Text("年")
                        Text(gamedata.month)
                        Text("月")
                        Text(gamedata.day)
                        Text("日")
                    }
                    Group{
                        Text("開催都道府県")
                            .padding(.top,10)
                        Text(gamedata.place)
                        Text("試合会場")
                            .padding(.top,10)
                        Text(gamedata.gamevenue)
                        
                    }
                }
            }.frame(width: 300, height: 500)
                .padding(.top,-100)
        }
    }
}
