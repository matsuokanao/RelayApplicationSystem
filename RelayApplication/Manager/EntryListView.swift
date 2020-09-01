//
//  EntryListView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/28.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct EntryListView: View {
    
    @ObservedObject var gamedata = getGamedataList()
    @State var pass = ""
    @State var num = ""
    @State var finishshow = false
    
    var body: some View {
        ZStack{
            Color("green6")
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                ScrollView{
                    Text("エントリーリスト")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    
                    HStack{
                        Spacer()
                        Button(action: {
                            self.finishshow.toggle()
                        }) {
                            Text("試合を終了させる")
                                .fontWeight(.bold)
                                .foregroundColor(Color("green6"))
                                .padding(.vertical)
                                .padding(.horizontal,10)
                                .background(Color.white)
                                .clipShape(Capsule())
                        }.padding(.top,20)
                            .sheet(isPresented: self.$finishshow) {
                                ManagerEndView()
                        }
                    }
                    
                    Text("試合の運営団体番号と運営団体パスワードを入力して下さい")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .padding(.top,20)
                    
                    Text("運営団体番号")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .padding(.top,20)
                    
                    
                    TextField("", text: self.$num)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(Color("green6"))
                    
                    Text("運営団パスワード")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                    
                    
                    TextField("", text: self.$pass)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(Color("green6"))
                    
                    ForEach(self.gamedata.data,id: \.id){i in
                        CellEntryListView(gamedata:i,pass: self.pass, num: self.num)
                    }
                }
            }.frame(width: 300, height: 500)
        }
    }
}


struct EntryListView_Previews: PreviewProvider {
    static var previews: some View {
        EntryListView()
    }
}

struct CellEntryListView: View {
    
    var gamedata : gamelist
    var pass : String
    var num : String
    @State var show = false
    @State var gshow = false
    @State var sex = ""
    
    var body: some View {
        VStack{
            if gamedata.grouppass == pass && gamedata.groupnum == num && gamedata.end == "false" {
                HStack {
                    Image(systemName: "circle.fill")
                        .foregroundColor(Color.white)
                    Text(gamedata.gamename)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top,10)
                    
                    Spacer()
                    VStack{
                        //男子
                        Button(action: {
                            self.show.toggle()
                        }) {
                            Image(systemName: "play.fill")
                                .foregroundColor(Color.blue)
                        }.sheet(isPresented: self.$show) {
                            EntrySelectListView(gamedata: self.gamedata, pass: self.pass, num: self.num, sex: "男子")
                            
                        }
                        //女子
                        Button(action: {
                            self.gshow.toggle()
                        }) {
                            Image(systemName: "play.fill")
                                .foregroundColor(Color.red)
                        }.sheet(isPresented: self.$gshow) {
                            EntrySelectListView(gamedata: self.gamedata, pass: self.pass, num: self.num, sex: "女子")
                        }
                    }
                }
            }
        }
    }
}



struct EntrySelectListView: View {
    @ObservedObject var completelist = getGameCompleteList()
    var gamedata : gamelist
    var pass : String
    var num : String
    @State var show = false
    var sex : String
    
    var body: some View {
        List{
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(Color("green6"))
                Text(sex + "100m")
                Spacer()
                Button(action: {
                    self.show.toggle()
                }) {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color("green6"))
                }.sheet(isPresented: self.$show) {
                    ForEach(self.completelist.data,id: \.id){i in
                        EntryShowListView(completelist: i, gamedata: self.gamedata, name: "100m", num: self.num, pass: self.pass, sex: self.sex)
                    }
                }
            }
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(Color("green6"))
                Text(sex + "200m")
                Spacer()
                Button(action: {
                    self.show.toggle()
                }) {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color("green6"))
                }.sheet(isPresented: self.$show) {
                    ForEach(self.completelist.data,id: \.id){i in
                        EntryShowListView(completelist: i, gamedata: self.gamedata, name: "200m", num: self.num, pass: self.pass, sex: self.sex)
                    }
                }
            }
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(Color("green6"))
                Text(sex + "400m")
                Spacer()
                Button(action: {
                    self.show.toggle()
                }) {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color("green6"))
                }.sheet(isPresented: self.$show) {
                    ForEach(self.completelist.data,id: \.id){i in
                        EntryShowListView(completelist: i, gamedata: self.gamedata, name: "400m", num: self.num, pass: self.pass, sex: self.sex)
                    }
                }
            }
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(Color("green6"))
                Text(sex + "ハードル走")
                Spacer()
                Button(action: {
                    self.show.toggle()
                }) {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color("green6"))
                }.sheet(isPresented: self.$show) {
                    ForEach(self.completelist.data,id: \.id){i in
                        EntryShowListView(completelist: i, gamedata: self.gamedata, name: "ハードル走", num: self.num, pass: self.pass, sex: self.sex)                                 }
                }
            }
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(Color("green6"))
                Text(sex + "走り幅跳び")
                Spacer()
                Button(action: {
                    self.show.toggle()
                }) {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color("green6"))
                }.sheet(isPresented: self.$show) {
                    ForEach(self.completelist.data,id: \.id){i in
                        EntryShowListView(completelist: i, gamedata: self.gamedata, name: "走り幅跳び", num: self.num, pass: self.pass, sex: self.sex)
                    }
                }
            }
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(Color("green6"))
                Text(sex + "砲丸投げ")
                Spacer()
                Button(action: {
                    self.show.toggle()
                }) {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color("green6"))
                }.sheet(isPresented: self.$show) {
                    ForEach(self.completelist.data,id: \.id){i in
                        EntryShowListView(completelist: i, gamedata: self.gamedata, name: "砲丸投げ", num: self.num, pass: self.pass, sex: self.sex)
                    }
                }
            }
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(Color("green6"))
                Text(sex + "走り高跳び")
                Spacer()
                Button(action: {
                    self.show.toggle()
                }) {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color("green6"))
                }.sheet(isPresented: self.$show) {
                    ForEach(self.completelist.data,id: \.id){i in
                        EntryShowListView(completelist: i, gamedata: self.gamedata, name: "走り高跳び", num: self.num, pass: self.pass, sex: self.sex)
                    }
                }
            }
        }
    }
}

struct EntryShowListView: View {
    var completelist : gamecomplete
    var gamedata : gamelist
    var name : String
    var num : String
    var pass : String
    var sex : String
    @State var show = false
    
    var body: some View {
        VStack{
            if completelist.pay == "true" && gamedata.gamename == completelist.gamename && completelist.sex == self.sex{
                if completelist.event1 == name || completelist.event2 == name || completelist.event3 == name{
                    HStack{
                        Image(systemName: "person.fill")
                            .foregroundColor(Color("green6"))
                        Text(completelist.sex)
                        Text(completelist.username)
                        Text(completelist.belong)
                    }
                }
            }
        }
    }
}
