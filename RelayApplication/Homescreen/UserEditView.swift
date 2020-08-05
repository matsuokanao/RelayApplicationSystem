//
//  UserEditView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/24.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import Firebase

struct UserEditView: View {
    @ObservedObject var userdata = getUserdataList()
    @State var email = ""
    @State var pass = ""
        
    var body: some View {
        ZStack{
        Color("red2")
            .edgesIgnoringSafeArea(.all)
        VStack(alignment: .leading){
            ScrollView{
            Text("ユーザー情報")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                
                Text("編集したいユーザーのメールアドレスとユーザーパスを入力して下さい")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .padding(.top,20)

                Text("メールアドレス")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .padding(.top,20)

                               
                TextField("", text: self.$email)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("red3"))
                Text("ユーザーパス")
                .foregroundColor(Color.white)
                .fontWeight(.bold)

                               
                TextField("", text: self.$pass)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("red3"))

            ForEach(self.userdata.data,id: \.id){i in
                                        
                UserEditCellView(userdata: i, email: self.email, pass: self.pass)
                    }
                }
            }.padding(.top,20)
            .frame(width: 300, height: 600)
        }
    }
}

struct UserEditView_Previews: PreviewProvider {
        static var previews: some View {
        UserEditView()
    }
}

 struct UserEditCellView :View {
    @State var show = false
    var userdata : userlist
    var email : String
    var pass : String
        
    var body: some View {
    VStack{
        
        if email == userdata.email && pass == userdata.userpass{
            List{
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(Color("red2"))
                    Text(userdata.username)
                        Spacer()
                        Button(action: {
                            self.show.toggle()
                                }) {
                        Image(systemName: "play.fill")
                                .foregroundColor(Color("red2"))
                                }.sheet(isPresented: self.$show) {
                                UserEditPracticeView(userdata: self.userdata, name: "username")
                        }
                    }
                    
                    HStack {
                    Image(systemName: "flame.fill")
                        .foregroundColor(Color("red2"))
                    Text(userdata.jaaf)
                        Spacer()
                        Button(action: {
                            self.show.toggle()
                                }) {
                        Image(systemName: "play.fill")
                                .foregroundColor(Color("red2"))
                                }.sheet(isPresented: self.$show) {
                                UserEditPracticeView(userdata: self.userdata,name: "jaaf")
                        }
                    }
                    
                    HStack {
                    Image(systemName: "person.3.fill")
                        .foregroundColor(Color("red2"))
                    Text(userdata.belong)
                        Spacer()
                        Button(action: {
                            self.show.toggle()
                                }) {
                        Image(systemName: "play.fill")
                                .foregroundColor(Color("red2"))
                                }.sheet(isPresented: self.$show) {
                                UserEditPracticeView(userdata: self.userdata,name: "belong")
                        }
                    }
                    
                    HStack {
                    Image(systemName: "rosette")
                        .foregroundColor(Color("red2"))
                    Text(userdata.ceo)
                        Spacer()
                        Button(action: {
                            self.show.toggle()
                                }) {
                        Image(systemName: "play.fill")
                                .foregroundColor(Color("red2"))
                                }.sheet(isPresented: self.$show) {
                                UserEditPracticeView(userdata: self.userdata,name: "ceo")
                        }
                    }
                    
                    HStack {
                    Image(systemName: "envelope.fill")
                        .foregroundColor(Color("red2"))
                    Text(userdata.email)
                        Spacer()
                        Button(action: {
                            self.show.toggle()
                                }) {
                        Image(systemName: "play.fill")
                                .foregroundColor(Color("red2"))
                                }.sheet(isPresented: self.$show) {
                                UserEditPracticeView(userdata: self.userdata,name: "email")
                        }
                    }
                    
                    HStack {
                    Image(systemName: "phone.fill")
                        .foregroundColor(Color("red2"))
                    Text(userdata.phonenumber)
                        Spacer()
                        Button(action: {
                            self.show.toggle()
                                }) {
                        Image(systemName: "play.fill")
                                .foregroundColor(Color("red2"))
                                }.sheet(isPresented: self.$show) {
                                UserEditPracticeView(userdata: self.userdata,name: "phonenumber")
                        }
                    }
                    
                    HStack {
                    Image(systemName: "folder.fill.badge.person.crop")
                        .foregroundColor(Color("red2"))
                    Text(userdata.userpass)
                        Spacer()
                        Button(action: {
                            self.show.toggle()
                                }) {
                        Image(systemName: "play.fill")
                                .foregroundColor(Color("red2"))
                                }.sheet(isPresented: self.$show) {
                                UserEditPracticeView(userdata: self.userdata,name: "userpass")
                        }
                    }
                }.frame(width: 300, height: 400)
                .padding(.top,20)
            }
        }
    }
}


struct UserEditPracticeView: View {
var userdata : userlist
    @State var edit = ""
    @State var name : String
    @State var showAlert = false
    @State var FshowAlert = false
    @State var title = ""
    @State var message = ""
    @State var dismissButton = ""

var body: some View {
    VStack{
    Text("変更内容を入力して下さい")
        .font(.headline)
        .fontWeight(.heavy)
        .foregroundColor(Color("red2"))
        
    TextField("変更内容", text: self.$edit)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .background(Color("red2"))
        
    Button(action: {
        if self.edit == "" {
            self.showAlert.toggle()
            self.title = "エラー"
            self.message = "項目を入力して下さい。"
            self.dismissButton = "OK"

        }else{
        self.FshowAlert.toggle()
            let db = Firestore.firestore()
            //試合申し込み完了テーブルに入れる
            db.collection("userlist")
                .document(self.userdata.email)
                .updateData([self.name: self.edit])
                { (err) in
        if err != nil{
            print((err?.localizedDescription)!)
                    return
                            }
                        }
                    }
            }) {
        Text("登録する")
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(.vertical)
                .padding(.horizontal,45)
                .background(Color("red3"))
                .clipShape(Capsule())
                
        }.alert(isPresented: $FshowAlert){
            Alert(title: Text("保存完了！"),
                  message: Text("内容を保存しました。"),
                  dismissButton: .default(Text("わかりました")))
            }
        .alert(isPresented: $showAlert){
                        Alert(title: Text(self.title),
                              message: Text(self.message),
                              dismissButton: .default(Text(self.dismissButton)))
        }
        }.frame(width: 300, height: 500)
    }
}

