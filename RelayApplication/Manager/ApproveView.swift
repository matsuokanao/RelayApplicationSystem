//
//  ApproveView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/28.
//  Copyright © 2020 松岡奈央. All rights reserved.
//  試合承認

import SwiftUI
import Firebase

struct ApproveView: View {
    @State var num = "" 
    @State var pass = ""
    @ObservedObject var gamedata = getGamedataList()
        var body: some View {
        ZStack{
        Color("green4")
            .edgesIgnoringSafeArea(.all)
        VStack(alignment: .leading){
                Text("試合の団体番号と団体パスワードを入力して下さい")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)

                Text("団体番号")
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                .padding(.top,20)

                               
                TextField("", text: self.$num)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("green4"))
                Text("団体パスワード")
                .foregroundColor(Color.white)
                .fontWeight(.bold)

                               
                TextField("", text: self.$pass)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("green4"))
            
            ForEach(self.gamedata.data,id: \.id){i in
                CellApproveView(num: self.num, pass: self.pass, gamelist: i)
                            
                }
            }.frame(width: 300, height: 500)
        }
    }
}

struct ApproveView_Previews: PreviewProvider {
    static var previews: some View {
        ApproveView()
    }
}

struct CellApproveView: View {
    
    var num : String
    var pass : String
    var gamelist : gamelist
    @State var show = false
    @ObservedObject var completelist = getGameCompleteList()
    
    var body: some View {
    VStack{
       if gamelist.grouppass == pass && gamelist.groupnum == num{
        HStack {
            
            Image(systemName: "person.fill")
                    .foregroundColor(Color.white)
            Text(gamelist.gamename)
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
            ForEach(self.completelist.data,id: \.id){i in
                ApproveSelectView(gamelist: self.gamelist, completelist: i)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }



struct ApproveSelectView: View {
    var gamelist : gamelist
    var completelist : gamecomplete
    @State var show = false
var body: some View {
        HStack {
            Image(systemName: "person.fill")
                                .foregroundColor(Color("green7"))
            Text(completelist.username)
                                Spacer()
                    Button(action: {
                            self.show.toggle()
                                        }) {
                    Image(systemName: "play.fill")
                                .foregroundColor(Color("green7"))
                                    }.sheet(isPresented: self.$show) {
                                        ApprovecompleateView(gamelist: self.gamelist, completelist: self.completelist)
                
            }
        }
    }
}



struct ApprovecompleateView: View {
    var gamelist : gamelist
    var completelist : gamecomplete
    @State var Alertshow = false
    @State var pay = "true"
var body: some View {
    HStack {
        Image(systemName: "person.fill")
                            .foregroundColor(Color("green7"))
        Text(gamelist.gamename)
                            Spacer()
                    Button(action: {
                        self.Alertshow = true
                                let db = Firestore.firestore()
                        let data: [String : Any] = ["event1": self.completelist.event1, "event2": self.completelist.event2, "event3": self.completelist.event3, "userpass": self.completelist.userpass, "email": self.completelist.email, "pay": self.pay, "gamename": self.completelist.gamename,"year": self.completelist.year,"month": self.completelist.month,"day": self.completelist.day, "place": self.completelist.place, "gamevenue": self.completelist.gamevenue, "groupname": self.completelist.groupname, "groupnum": self.completelist.groupnum, "grouppass": self.completelist.grouppass, "jaaf": self.completelist.jaaf,"belong": self.completelist.belong, "phonenumber": self.completelist.phonenumber, "ceo": self.completelist.ceo, "username": self.completelist.username]
                                //試合申し込み完了テーブルに入れる
                                db.collection("gameapprove")
                                    .addDocument(data:data)
                                        { (err) in
                                            if err != nil{
                                                print((err?.localizedDescription)!)
                                                    return
                                        }
                                    }
                            }) {
                        
                                    Text("承認")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("green2"))
                                        .padding(.vertical)
                                        .padding(.horizontal,45)
                                        .background(Color.white)
                                        .clipShape(Capsule())
                                        
                                }.alert(isPresented: $Alertshow){
                                    Alert(title: Text("登録完了！"),
                                          message: Text("登録が完了しました。内容をご確認下さい。"),
                                          dismissButton: .default(Text("わかりました")))
                            }
                        Spacer()}
                                        
                                    
                        
                    
    } }



