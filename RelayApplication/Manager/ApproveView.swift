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
    @State var relayshow = false
    @ObservedObject var gamedata = getGamedataList()
    @ObservedObject var keyboard = KeyboardObserver()
    
    var body: some View {
        ZStack{
            Color("green4")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading){
                ScrollView{
                    Text("承認ページ")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    
                    HStack{
                        Spacer()
                        Button(action: {
                            self.relayshow.toggle()
                        }) {
                            Text("リレー承認ページ")
                                .fontWeight(.bold)
                                .foregroundColor(Color("green4"))
                                .padding(.vertical)
                                .padding(.horizontal,10)
                                .background(Color.white)
                                .clipShape(Capsule())
                        }.padding(.top,20)
                            .sheet(isPresented: self.$relayshow) {
                                RelayApproveView()
                        }
                    }
                    
                    
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
                        .background(Color("green4"))
                    Text("団体パスワード")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                    
                    TextField("", text: self.$pass)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(Color("green4"))
                    
                    ForEach(self.gamedata.data,id: \.id){i in
                        CellApproveView(gamelist: i, num: self.num, pass: self.pass)
                        
                    }
                }.onAppear{
                    self.keyboard.startObserve()
                }.onDisappear{
                    self.keyboard.stopObserve()
                }.padding(.bottom, keyboard.keyboardHeight)
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
    var gamelist : gamelist
    var num : String
    var pass : String
    @State var show = false
    @State var relayshow = false
    @ObservedObject var completelist = getGameCompleteList()
    
    var body: some View {
        VStack{
            
            if gamelist.grouppass == pass && gamelist.groupnum == num && gamelist.end == "false"{
                
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
            }        }
    }
}


struct ApproveSelectView: View {
    var gamelist : gamelist
    var completelist : gamecomplete
    @State var show = false
    var body: some View {
        HStack {
            if gamelist.gamename == completelist.gamename && completelist.pay == "false"{
                Image(systemName: "person.fill")
                    .foregroundColor(Color("green4"))
                
                Text(completelist.username)
                Text(completelist.belong)
                Spacer()
                Button(action: {
                    self.show.toggle()
                }) {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color("green4"))
                }.sheet(isPresented: self.$show) {
                    
                    ApprovecompleateView(gamelist: self.gamelist, completelist: self.completelist)
                }
            } else {
                
            }
        }
    }
}



struct ApprovecompleateView: View {
    var gamelist : gamelist
    var completelist : gamecomplete
    @State var Alertshow = false
    @State var pay = "pay"
    @State var t = "true"
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .foregroundColor(Color("green4"))
            VStack{
                Text(completelist.username)
                Text(completelist.event1)
                Text(completelist.event2)
                Text(completelist.event3)
            }
            Spacer()
            Button(action: {
                self.Alertshow.toggle()
                let db = Firestore.firestore()
               
                db.collection("gamecomplete")
                    .document(self.completelist.id)
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
                Alert(title: Text("承認完了！"),
                      message: Text("承認が完了しました。内容をご確認下さい。"),
                      dismissButton: .default(Text("わかりました")))
            }
            Spacer()
        }.padding(.top,20)
    }
}



