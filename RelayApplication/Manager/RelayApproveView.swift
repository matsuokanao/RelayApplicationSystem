//
//  RelayApproveView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/02.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct RelayApproveView: View {
    @State var num = ""
    @State var pass = ""
    @ObservedObject var gamedata = getGamedataList()
    
    var body: some View {
        ZStack{
            Color(.white)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading){
                ScrollView{
                    Text("リレー承認ページ")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("green4"))
                    
                    Text("試合の団体番号と団体パスワードを入力して下さい")
                        .foregroundColor(Color("green4"))
                        .fontWeight(.bold)
                        .padding(.top,20)
                    Text("団体番号")
                        .foregroundColor(Color("green4"))
                        .fontWeight(.bold)
                        .padding(.top,30)
                    
                    
                    TextField("", text: self.$num)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(Color("green4"))
                    Text("団体パスワード")
                        .foregroundColor(Color("green4"))
                        .fontWeight(.bold)
                    
                    
                    TextField("", text: self.$pass)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(Color("green4"))
                    
                    ForEach(self.gamedata.data,id: \.id){i in
                        CellRelayApproveView(gamelist: i, num: self.num, pass: self.pass)
                        
                    }
                }
            }.frame(width: 300, height: 500)
        }
    }
}


struct RelayApproveView_Previews: PreviewProvider {
    static var previews: some View {
        RelayApproveView()
    }
}


struct CellRelayApproveView: View {
    @ObservedObject var relaydata = getRelayCompleteList()
    var gamelist : gamelist
    var num : String
    var pass : String
    @State var show = false
    var body: some View {
        VStack{
            
            if gamelist.grouppass == pass && gamelist.groupnum == num && gamelist.end == "false" && gamelist.relay == "はい" {
                
                HStack {
                    
                    Image(systemName: "person.fill")
                        .foregroundColor(Color("green4"))
                    Text(gamelist.gamename)
                        .fontWeight(.bold)
                        .foregroundColor(Color("green4"))
                        .padding(.top,10)
                    
                    Spacer()
                    Button(action: {
                        
                        self.show.toggle()
                    }) {
                        Image(systemName: "play.fill")
                            .foregroundColor(Color("green4"))
                    }.sheet(isPresented: self.$show) {
                        ForEach(self.relaydata.data,id: \.id){i in
                            RelayApproveShowView(gamelist: self.gamelist, relaylist: i)
                            
                        }
                    }
                }
            }
        }
    }
}

struct RelayApproveShowView: View {
    var gamelist : gamelist
    var relaylist : relaycomplete
    @State var show = false
    var body: some View {
        HStack {
            if gamelist.gamename == relaylist.gamename && relaylist.pay == "false"{
                Image(systemName: "person.fill")
                    .foregroundColor(Color("green4"))
                
                Text(relaylist.belong)
                Text(relaylist.username)
                Text(relaylist.event)
                Spacer()
                Button(action: {
                    self.show.toggle()
                }) {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color("green4"))
                }.sheet(isPresented: self.$show) {
                    
                    RelayApproveCompleteView(gamelist: self.gamelist, relaylist: self.relaylist)
                }
            }
        }.padding(.top,20)
        
    }
}

struct RelayApproveCompleteView: View {
    var gamelist : gamelist
    var relaylist : relaycomplete
    @State var Alertshow = false
    @State var pay = "pay"
    @State var t = "true"
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .foregroundColor(Color("green4"))
            Text(relaylist.belong)
            VStack{
                Text(relaylist.event)
                Text(relaylist.member1)
                Text(relaylist.member2)
                Text(relaylist.member3)
                Text(relaylist.member4)
                Text(relaylist.member5)
                Text(relaylist.member6)
            }
            Spacer()
            Button(action: {
                self.Alertshow = true
                let db = Firestore.firestore()
                
                db.collection("relaycomplete")
                    .document(self.relaylist.id)
                    .updateData([self.pay: self.t])
                    { (err) in
                        if err != nil{
                            print((err?.localizedDescription)!)
                            return
                    }
                }
                
            }) {
                Text("承認")
                    .fontWeight(.bold)
                    .foregroundColor(Color("green4"))
                    .padding(.vertical)
                    .padding(.horizontal,45)
                    .background(Color.white)
                    .clipShape(Capsule())
                
            }.alert(isPresented: $Alertshow){
                Alert(title: Text("登録完了！"),
                      message: Text("登録が完了しました。内容をご確認下さい。"),
                      dismissButton: .default(Text("わかりました")))
            }
            Spacer()
        }.padding(.top,20)
    }
}



