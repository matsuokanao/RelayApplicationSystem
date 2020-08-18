//
//  RelayOrderView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/02.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct RelayOrderView: View {
    @ObservedObject var data = getRelayCompleteList()
    @State var email = ""
    @State var pass =   ""
    var body: some View {
        ZStack{
                Color("yello2")
                        .edgesIgnoringSafeArea(.all)
        VStack(alignment: .leading){
            ScrollView{
            Text("リレーオーダー提出")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            Text("試合申し込み時に入力したユーザーパスとメールアドレスを入力して下さい")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
            .padding(.top,20)

            Text("メールアドレス")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .padding(.top,20)

            TextField("メールアドレス", text: self.$email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("yello2"))
                        
            Text("ユーザーパス")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .padding(.top,20)

            TextField("ユーザーパス", text: self.$pass)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .background(Color("yello2"))

        ForEach(self.data.data,id: \.id){i in
            CellRelayOrderView(relaylist: i, email: self.email, pass: self.pass)
                        }
                    }.frame(width: 300, height: 600)
                }
            }
        }
}

struct RelayOrderView_Previews: PreviewProvider {
    static var previews: some View {
        RelayOrderView()
    }
}

struct CellRelayOrderView: View {
    @State var show = false
    var relaylist : relaycomplete
    var email : String
    var pass : String
var body: some View {
            VStack{
                if relaylist.email == email && relaylist.userpass == pass && relaylist.pay == "true" && relaylist.order == "false" {
        HStack {
            Image(systemName: "person.fill")
                    .foregroundColor(Color.white)
            Text(relaylist.gamename)
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                                    Spacer()
        Button(action: {
                        self.show.toggle()
                                }) {
            Image(systemName: "play.fill")
                    .foregroundColor(Color.white)
                    }.sheet(isPresented: self.$show) {

                        RelayOrderShowView(relaylist: self.relaylist)
                               
                           }
                       }.padding(.top,20)
                   }
               }
           }
        }

struct RelayOrderShowView: View {
    
    @State var show = false
    @State var order1 = ""
    @State var order2 = ""
    @State var order3 = ""
    @State var order4 = ""
    @State var set = ""
    @State var lanes = ""
    @State var showAlert = false
    @State var title = ""
    @State var message = ""
    @State var dismissButton = ""
    var relaylist : relaycomplete
    
var body: some View {
    VStack{
            VStack{
       Text("リレーオーダー表を提出して下さい。")
        .fontWeight(.bold)
        .foregroundColor(.white)
        }.frame(width:500,height: 100)
        .background(Color("yello2"))
        Text("1度提出したリレーオーダー表は訂正出来ません。ご注意下さい。")
        .fontWeight(.bold)
        .foregroundColor(.red)
        .frame(width:300,height: 50)

    ScrollView{
        Text("組・レーン")
        .fontWeight(.bold)

        HStack{
            TextField("1組", text: self.$set)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("yello2"))
            Text("組")
                .foregroundColor(Color("blackcolor"))
                .fontWeight(.bold)
            TextField("1レーン", text: self.$lanes)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("yello2"))
            Text("レーン")
                .foregroundColor(Color("blackcolor"))
                .fontWeight(.bold)
           
        }
        Group{
        
        Text("1走者")
            .fontWeight(.bold)
        TextField("1走者", text: self.$order1)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .background(Color("yello2"))

        Text("2走者")
            .fontWeight(.bold)
        TextField("2走者", text: self.$order2)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .background(Color("yello2"))

        Text("3走者")
            .fontWeight(.bold)
        TextField("3走者", text: self.$order3)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .background(Color("yello2"))

        Text("4走者")
            .fontWeight(.bold)
        TextField("4走者", text: self.$order4)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .background(Color("yello2"))
        }
        HStack{
            Spacer()
        Button(action: {
            if self.order1 == "" || self.order2 == "" || self.order3 == "" || self.order4 == "" || self.set == "" ||
            self.lanes == "" {
                self.showAlert.toggle()
                self.title = "エラー"
                self.message = "全ての項目を入力して下さい。"
                self.dismissButton = "OK"
                
            }else if self.order1 != self.relaylist.member1 && self.order1 != self.relaylist.member2 && self.order1 != self.relaylist.member3 && self.order1 != self.relaylist.member4 && self.order1 != self.relaylist.member5 && self.order1 != self.relaylist.member6 {
                self.showAlert.toggle()
                self.title = "エラー"
            self.message = "試合申込み時に入力したエントリーメンバーをご記入下さい。"
                self.dismissButton = "OK"
                
            }else if self.order2 != self.relaylist.member1 && self.order2 != self.relaylist.member2 && self.order2 != self.relaylist.member3 && self.order2 != self.relaylist.member4 && self.order2 != self.relaylist.member5 && self.order2 != self.relaylist.member6 {
                self.showAlert.toggle()
                self.title = "エラー"
            self.message = "試合申込み時に入力したエントリーメンバーをご記入下さい。"
                self.dismissButton = "OK"
                
            }else if self.order3 != self.relaylist.member1 && self.order3 != self.relaylist.member2 && self.order3 != self.relaylist.member3 && self.order3 != self.relaylist.member4 && self.order3 != self.relaylist.member5 && self.order3 != self.relaylist.member6 {
                self.showAlert.toggle()
                self.title = "エラー"
            self.message = "試合申込み時に入力したエントリーメンバーをご記入下さい。"
                self.dismissButton = "OK"
                
            }else if self.order4 != self.relaylist.member1 && self.order4 != self.relaylist.member2 && self.order4 != self.relaylist.member3 && self.order4 != self.relaylist.member4 && self.order4 != self.relaylist.member5 && self.order4 != self.relaylist.member6 {
                self.showAlert.toggle()
                self.title = "エラー"
            self.message = "試合申込み時に入力したエントリーメンバーをご記入下さい。"
                self.dismissButton = "OK"
                
            }else{
            self.show.toggle()
            }
        }){
            Text("確認する")
                .fontWeight(.bold)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 30)

            .sheet(isPresented: $show){
                CellRelayView(order1: self.order1, order2: self.order2, order3: self.order3,order4: self.order4,set :self.set, lanes: self.lanes,relaylist : self.relaylist)
        
                        }.alert(isPresented: $showAlert){
                            Alert(title: Text(self.title),
                                  message: Text(self.message),
                                  dismissButton: .default(Text(self.dismissButton)))
                        }
                    }.background(Color("yello2"))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    Spacer()
            }
        }
    }.frame(width: 300, height: 600)
}

struct CellRelayView: View {
    var order1 :String
    var order2 :String
    var order3 :String
    var order4 :String
    var set : String
    var lanes : String
    @State var show = false
    var relaylist : relaycomplete
    @State var order = "order"
    @State var t = "true"

    
    var body: some View {
        VStack{
            Text("最終確認")
                .fontWeight(.bold)
                .padding(.top,10)
                .foregroundColor(.red)
                .font(.title)
            Text("完了ボタンを押すと内容を変更できません。リレーメンバー、走順に間違いが無いかご確認下さい。")
                .fontWeight(.bold)
                .padding(.top,20)
                .foregroundColor(.red)
                
           
            Group{
                Text("試合名")
                    .fontWeight(.bold)
                    .padding(.top,10)
                Text(relaylist.gamename)
                    .fontWeight(.bold)
                
                Text("所属名")
                    .fontWeight(.bold)
                    .padding(.top,10)
                Text(relaylist.belong)
                    .fontWeight(.bold)
                Text("代表者名")
                    .fontWeight(.bold)
                    .padding(.top,10)
                    
                Text(relaylist.username)
                    .fontWeight(.bold)
                Text("種目")
                    .fontWeight(.bold)
                    .padding(.top,10)
                Text(relaylist.event)
                .   fontWeight(.bold)
                Text("組・レーン")
                    .fontWeight(.bold)
                    .padding(.top,10)
            }
            
            HStack{
                Text(set)
                    .fontWeight(.bold)
                Text("組")
                    .fontWeight(.bold)
                Text(lanes)
                    .fontWeight(.bold)
                Text("レーン")
                    .fontWeight(.bold)
            }
                Text("リレーオーダーメンバー")
                    .fontWeight(.bold)
                    .padding(.top,10)
            HStack{
                Text("1走")
                    .fontWeight(.bold)
                Text(order1)
                    .fontWeight(.bold)
            }
            HStack{
                Text("2走")
                    .fontWeight(.bold)
                Text(order2)
                    .fontWeight(.bold)
            }
            HStack{
                Text("3走")
                    .fontWeight(.bold)
                Text(order3)
                    .fontWeight(.bold)
            }
            HStack{
                Text("4走")
                    .fontWeight(.bold)
                Text(order4)
                    .fontWeight(.bold)
            }


            HStack{
                    Spacer()
                Button(action: {
                    self.show.toggle()
                    
                    let db = Firestore.firestore()
                    let data: [String : Any] = ["set": self.set,"lanes":self.lanes,"event":self.relaylist.event,"order1": self.order1, "order2": self.order2,"order3": self.order3,"order4": self.order4,"userpass": self.relaylist.userpass, "email": self.relaylist.email, "pay": self.relaylist.pay,"gamename":self.relaylist.gamename,"year":self.relaylist.year,"month":self.relaylist.month,"day":self.relaylist.day,"place":self.relaylist.place,"gamevenue":self.relaylist.gamevenue,"groupnum":self.relaylist.groupnum,"groupname":self.relaylist.groupname,"grouppass": self.relaylist.grouppass,"jaaf":self.relaylist.jaaf,"belong":self.relaylist.belong,"phonenumber":self.relaylist.phonenumber,"ceo":self.relaylist.ceo,"username":self.relaylist.username]
                    //試合申し込み完了テーブルに入れる
                    db.collection("ordercomplete")
                       .addDocument(data:data)
                            { (err) in
                                if err != nil{
                                        return
                            }
                        }
                    let dbr = Firestore.firestore()
                            dbr.collection("relaycomplete")
                            .document(self.relaylist.id)
                            .updateData([self.order: self.t])
                    { (err) in
                            if err != nil{
                                    return
                        }
                    }
                }){
                    Text("完了")
                        
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .sheet(isPresented: $show){
                        RelayOrderFinishView()
                
                            }
                        }.background(Color("yello2"))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
        }
    }
}


