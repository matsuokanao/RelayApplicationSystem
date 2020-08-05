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
                Color("yello3")
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
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("yello3"))
                        
            Text("ユーザーパス")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .padding(.top,20)

            TextField("ユーザーパス", text: self.$pass)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .background(Color("yello3"))

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
                if relaylist.email == email && relaylist.userpass == pass && relaylist.pay == "true" {
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
    
    var relaylist : relaycomplete
    
var body: some View {
    VStack{
            VStack{
       Text("リレーオーダー表を提出して下さい。")
        .fontWeight(.bold)
        .foregroundColor(.white)
        }.frame(width:500,height: 100)
        .background(Color("yello3"))
        Text("1度提出したリレーオーダー表は訂正出来ません。ご注意下さい。")
        .fontWeight(.bold)
        .foregroundColor(.red)
        .frame(width:300,height: 50)

    ScrollView{
        
        HStack{
        
            TextField("組", text: self.$set)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("yello3"))
            Text("組")
                .foregroundColor(Color("blackcolor"))
                .fontWeight(.bold)
            TextField("レーン", text: self.$lanes)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("yello3"))
            Text("レーン")
                .foregroundColor(Color("blackcolor"))
                .fontWeight(.bold)
           
        }
        Group{
        
        Text("1走者")
        TextField("1走者", text: self.$order1)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .background(Color("yello3"))

        Text("2走者")
        TextField("2走者", text: self.$order2)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .background(Color("yello3"))

        Text("3走者")
        TextField("3走者", text: self.$order3)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .background(Color("yello3"))

        Text("4走者")
        TextField("4走者", text: self.$order4)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .background(Color("yello3"))
        }
        HStack{
            Spacer()
        Button(action: {
            self.show.toggle()
        }){
            Text("確認する")
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 30)

            .sheet(isPresented: $show){
                CellRelayView(order1: self.order1, order2: self.order2, order3: self.order3,order4: self.order4,set :self.set, lanes: self.lanes,relaylist : self.relaylist)
        
                        }
                    }.background(Color("yello3"))
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

    
    var body: some View {
        VStack{
                Group{
                Text("試合名")
                Text(relaylist.gamename)
                Text("所属名")
                Text(relaylist.belong)
                Text("組織代表者名")
                Text(relaylist.username)
                Text("種目")
                Text(relaylist.event)
            }
            HStack{
                Text(set)
                Text("組")
                Text(lanes)
                Text("レーン")
            }
                Text("リレーオーダーメンバー")
                Text(order1)
                Text(order2)
                Text(order3)
                Text(order4)

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
                }){
                    Text("完了")
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .sheet(isPresented: $show){
                        RelayApplicationFinishView()
                
                            }
                        }.background(Color("yello3"))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
        }
    }
}


