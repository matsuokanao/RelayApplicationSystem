//
//  GameEditView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/28.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct GameEditView: View {
    @ObservedObject var gamedata = getGamedataList()
    @State var num = ""
    @State var pass = ""
    
    var body: some View {
        VStack{
            ZStack{
            Color("green7")
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                ScrollView{
                    Text("試合内容編集")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)

                    Text("試合の団体番号と団体パスワードを入力して下さい")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .padding(.top,20)

                    Text("団体番号")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .padding(.top,20)

                                   
                    TextField("", text: self.$num)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(Color("green7"))
                    Text("団体パスワード")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)

                                   
                    TextField("", text: self.$pass)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(Color("green7"))

            ForEach(self.gamedata.data,id: \.id){i in
                CellGameEditView(gamedata: i, num: self.num, pass: self.pass)
                        }
                    }
                }.frame(width: 300, height: 500)
            }
        }
    }
}

struct GameEditView_Previews: PreviewProvider {
    static var previews: some View {
        GameEditView()
    }
}

struct CellGameEditView: View {
    var gamedata : gamelist
    var num : String
    var pass : String
    @State var show = false

var body: some View {
    VStack{
        if gamedata.groupnum == num && gamedata.grouppass == pass{
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(Color.white)
                    Text(gamedata.gamename)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top,10)

                            Spacer()
                Button(action: {
                        self.show.toggle()
                                    }) {
                Image(systemName: "play.fill")
                    .foregroundColor(Color.white)
                                }.sheet(isPresented: self.$show) {
                            GameEditSelectView(gamedata: self.gamedata)
                        
                    }
                }
            }
        }
    }
}


struct GameEditSelectView: View {
    var gamedata : gamelist
    @State var show = false
var body: some View {
        List{
            HStack {
                Image(systemName: "person.fill")
                                    .foregroundColor(Color("green7"))
                            Text(gamedata.gamename)
                                    Spacer()
                        Button(action: {
                                self.show.toggle()
                                            }) {
                        Image(systemName: "play.fill")
                                    .foregroundColor(Color("green7"))
                                        }.sheet(isPresented: self.$show) {
                                            GameEditPracticeView(gamedata: self.gamedata, name: "username")
                                            }
                                        }
                                        
                                        HStack {
                                        Image(systemName: "flame.fill")
                                            .foregroundColor(Color("green7"))
                                        Text(gamedata.year)
                                            Spacer()
                                            Button(action: {
                                                self.show.toggle()
                                                    }) {
                                            Image(systemName: "play.fill")
                                                    .foregroundColor(Color("green7"))
                                                    }.sheet(isPresented: self.$show) {
                                                    GameEditPracticeView(gamedata: self.gamedata,name: "year")
                                            }
                                        }
                                        
                                        HStack {
                                        Image(systemName: "person.3.fill")
                                            .foregroundColor(Color("green7"))
                                        Text(gamedata.month)
                                            Spacer()
                                            Button(action: {
                                                self.show.toggle()
                                                    }) {
                                            Image(systemName: "play.fill")
                                                    .foregroundColor(Color("green7"))
                                                    }.sheet(isPresented: self.$show) {
                                                    GameEditPracticeView(gamedata: self.gamedata,name: "month")
                                            }
                                        }
                                        
                                        HStack {
                                        Image(systemName: "rosette")
                                            .foregroundColor(Color("green7"))
                                        Text(gamedata.day)
                                            Spacer()
                                            Button(action: {
                                                self.show.toggle()
                                                    }) {
                                            Image(systemName: "play.fill")
                                                    .foregroundColor(Color("green7"))
                                                    }.sheet(isPresented: self.$show) {
                                                    GameEditPracticeView(gamedata: self.gamedata,name: "day")
                                            }
                                        }
                        
                        
                                        HStack {
                                        Image(systemName: "envelope.fill")
                                            .foregroundColor(Color("green7"))
                                        Text(gamedata.place)
                                            Spacer()
                                            Button(action: {
                                                self.show.toggle()
                                                    }) {
                                            Image(systemName: "play.fill")
                                                    .foregroundColor(Color("green7"))
                                                    }.sheet(isPresented: self.$show) {
                                                    GameEditPracticeView(gamedata: self.gamedata,name: "place")
                                            }
                                        }
                                        
                                        HStack {
                                        Image(systemName: "phone.fill")
                                            .foregroundColor(Color("green7"))
                                        Text(gamedata.gamevenue)
                                            Spacer()
                                            Button(action: {
                                                self.show.toggle()
                                                    }) {
                                            Image(systemName: "play.fill")
                                                    .foregroundColor(Color("green7"))
                                                    }.sheet(isPresented: self.$show) {
                                                    GameEditPracticeView(gamedata: self.gamedata,name: "gamevenue")
                                            }
                                        }
                                        
                                        HStack {
                                        Image(systemName: "folder.fill.badge.person.crop")
                                            .foregroundColor(Color("green7"))
                                        Text(gamedata.png)
                                            Spacer()
                                            Button(action: {
                                                self.show.toggle()
                                                    }) {
                                            Image(systemName: "play.fill")
                                                    .foregroundColor(Color("green7"))
                                                    }.sheet(isPresented: self.$show) {
                                                    GameEditPracticeView(gamedata: self.gamedata,name: "png")
                                            }
                                        }

                                        HStack {
                                        Image(systemName: "flag.fill")
                                            .foregroundColor(Color("green7"))
                                        Text(gamedata.link)
                                            Spacer()
                                            Button(action: {
                                                self.show.toggle()
                                                    }) {
                                            Image(systemName: "play.fill")
                                                    .foregroundColor(Color("green7"))
                                                    }.sheet(isPresented: self.$show) {
                                                    GameEditPracticeView(gamedata: self.gamedata,name: "link")
                                }
                            }
                        }
                    }
                }

        



struct GameEditPracticeView: View {
    var gamedata : gamelist
        @State var edit = ""
        @State var showAlert = false
        @State var name : String

            var body: some View {
                VStack{
                Text("変更内容を入力して下さい")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("green7"))
                    
                TextField("変更内容", text: self.$edit)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("green7"))
                    
                Button(action: {
                    self.showAlert = true
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
                        }) {
                    Text("登録")
                                .fontWeight(.bold)
                                .foregroundColor(Color("green7"))
                                .padding(.vertical)
                                .padding(.horizontal,45)
                                .background(Color.white)
                                .clipShape(Capsule())
                                
                        }.alert(isPresented: $showAlert){
                            Alert(title: Text("登録完了！"),
                                  message: Text("登録が完了しました。内容をご確認下さい。"),
                                  dismissButton: .default(Text("わかりました")))
            }
        }.frame(width: 300, height: 500)
    }
}

    
