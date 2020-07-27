//
//  UserEditView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/24.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct UserEditView: View {
    @ObservedObject var authority = getAuthorityList()
    @ObservedObject var userdata = getUserdataList()
    
    var body: some View {
        ZStack{
        Color("skyblue")
            .edgesIgnoringSafeArea(.all)
        VStack{
            ForEach(self.userdata.data,id: \.id){i in
                ForEach(self.authority.data,id: \.id){a in
                    
            UserEditCellView(userdata: i, authoritydata: a)
                    }
                }
            }
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
    var authoritydata : authority

 var body: some View {
    VStack{
        if authoritydata.email == userdata.email{
            List{
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(Color("skyblue"))
                    Text(userdata.username)
                        Spacer()
                        Button(action: {
                            self.show.toggle()
                                }) {
                        Image(systemName: "play.fill")
                                .foregroundColor(Color("skyblue"))
                                }.sheet(isPresented: self.$show) {
                                UserEditPracticeView(userdata: self.userdata, name: "username")
                        }
                    }
                    
                    HStack {
                    Image(systemName: "flame.fill")
                        .foregroundColor(Color("skyblue"))
                    Text(userdata.jaaf)
                        Spacer()
                        Button(action: {
                            self.show.toggle()
                                }) {
                        Image(systemName: "play.fill")
                                .foregroundColor(Color("skyblue"))
                                }.sheet(isPresented: self.$show) {
                                UserEditPracticeView(userdata: self.userdata,name: "jaaf")
                        }
                    }
                    
                    HStack {
                    Image(systemName: "person.3.fill")
                        .foregroundColor(Color("skyblue"))
                    Text(userdata.belong)
                        Spacer()
                        Button(action: {
                            self.show.toggle()
                                }) {
                        Image(systemName: "play.fill")
                                .foregroundColor(Color("skyblue"))
                                }.sheet(isPresented: self.$show) {
                                UserEditPracticeView(userdata: self.userdata,name: "belong")
                        }
                    }
                    
                    HStack {
                    Image(systemName: "rosette")
                        .foregroundColor(Color("skyblue"))
                    Text(userdata.ceo)
                        Spacer()
                        Button(action: {
                            self.show.toggle()
                                }) {
                        Image(systemName: "play.fill")
                                .foregroundColor(Color("skyblue"))
                                }.sheet(isPresented: self.$show) {
                                UserEditPracticeView(userdata: self.userdata,name: "ceo")
                        }
                    }
                    
                    HStack {
                    Image(systemName: "envelope.fill")
                        .foregroundColor(Color("skyblue"))
                    Text(userdata.email)
                        Spacer()
                        Button(action: {
                            self.show.toggle()
                                }) {
                        Image(systemName: "play.fill")
                                .foregroundColor(Color("skyblue"))
                                }.sheet(isPresented: self.$show) {
                                UserEditPracticeView(userdata: self.userdata,name: "email")
                        }
                    }
                    
                    HStack {
                    Image(systemName: "phone.fill")
                        .foregroundColor(Color("skyblue"))
                    Text(userdata.phonenumber)
                        Spacer()
                        Button(action: {
                            self.show.toggle()
                                }) {
                        Image(systemName: "play.fill")
                                .foregroundColor(Color("skyblue"))
                                }.sheet(isPresented: self.$show) {
                                UserEditPracticeView(userdata: self.userdata,name: "phonenumber")
                        }
                    }
                    
                    HStack {
                    Image(systemName: "folder.fill.badge.person.crop")
                        .foregroundColor(Color("skyblue"))
                    Text(userdata.userpass)
                        Spacer()
                        Button(action: {
                            self.show.toggle()
                                }) {
                        Image(systemName: "play.fill")
                                .foregroundColor(Color("skyblue"))
                                }.sheet(isPresented: self.$show) {
                                UserEditPracticeView(userdata: self.userdata,name: "userpass")
                        }
                    }

                    HStack {
                    Image(systemName: "flag.fill")
                        .foregroundColor(Color("skyblue"))
                    Text(userdata.belongpass)
                        Spacer()
                        Button(action: {
                            self.show.toggle()
                                }) {
                        Image(systemName: "play.fill")
                                .foregroundColor(Color("skyblue"))
                                }.sheet(isPresented: self.$show) {
                                UserEditPracticeView(userdata: self.userdata,name: "belongpass")
                        }
                    }
                }
            }
        }
    }
}


struct UserEditPracticeView: View {
var userdata : userlist
    @State var edit = ""
    @State var show = false
    @State var name : String

var body: some View {
    VStack{
    Text("変更内容を入力して下さい")
        .font(.headline)
        .fontWeight(.heavy)
        .foregroundColor(Color("skyblue"))
        
    TextField("変更内容", text: self.$edit)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .background(Color("skyblue"))
        
    Button(action: {
        self.show.toggle()
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
            }) {
        Text("編集する")
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.width - 30)
            .sheet(isPresented: $show){
                UserEditFinishView()
                        }
                    }.background(Color("skyblue"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
        }.frame(width: 300, height: 500)
    }
}

