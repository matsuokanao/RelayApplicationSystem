//
//  ManagerEditView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/29.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct ManagerEditView: View {
    @ObservedObject var data = getManagerList()
    @State var num = ""
    @State var pass = ""
    var body: some View {
        ZStack{
        Color("green8")
            .edgesIgnoringSafeArea(.all)
        VStack(alignment: .leading){
            ScrollView{
                Text("運営団体編集")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("編集したい運営団体の運営団体番号と運営団体パスワードを入力して下さい")
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
                    .background(Color("green8"))
            
                Text("運営団パスワード")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)

                               
                TextField("", text: self.$pass)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("green8"))
            
            ForEach(self.data.data,id: \.id){i in
                CellManagerEditView(managerdata: i, num: self.num, pass: self.pass)
                    }
                }
            }.frame(width: 300, height: 500)
        }
    }
}

struct ManagerEditView_Previews: PreviewProvider {
    static var previews: some View {
        ManagerEditView()
    }
}

struct CellManagerEditView: View {
    var managerdata :managerlist
    var num : String
    var pass : String
    @State var show = false
    
    var body: some View {
        VStack{
            if managerdata.groupnum == num && managerdata.grouppass == pass{
        List{
            HStack {
                Image(systemName: "person.fill")
                            .foregroundColor(Color("green8"))
                Text(managerdata.groupname)
                            Spacer()
            Button(action: {
                            self.show.toggle()
                                        }) {
                Image(systemName: "play.fill")
                        .foregroundColor(Color("green8"))
                                }.sheet(isPresented: self.$show) {
                                ManagerEditPracticeView(managerdata: self.managerdata, name: "groupname")
                                }
                            }
                            
                            HStack {
                            Image(systemName: "flame.fill")
                                .foregroundColor(Color("green8"))
                                Text(managerdata.groupnum)
                                Spacer()
                                Button(action: {
                                    self.show.toggle()
                                        }) {
                                Image(systemName: "play.fill")
                                        .foregroundColor(Color("green8"))
                                        }.sheet(isPresented: self.$show) {
                                        ManagerEditPracticeView(managerdata: self.managerdata,name: "groupnum")
                                }
                            }
                            
                            HStack {
                            Image(systemName: "person.3.fill")
                                .foregroundColor(Color("green8"))
                                Text(managerdata.grouppass)
                                Spacer()
                                Button(action: {
                                    self.show.toggle()
                                        }) {
                                Image(systemName: "play.fill")
                                        .foregroundColor(Color("green8"))
                                        }.sheet(isPresented: self.$show) {
                                        ManagerEditPracticeView(managerdata: self.managerdata,name: "grouppass")
                                }
                            }
                            
                            HStack {
                            Image(systemName: "rosette")
                                .foregroundColor(Color("green8"))
                            Text(managerdata.email)
                                Spacer()
                                Button(action: {
                                    self.show.toggle()
                                        }) {
                                Image(systemName: "play.fill")
                                        .foregroundColor(Color("green8"))
                                        }.sheet(isPresented: self.$show) {
                                ManagerEditPracticeView(managerdata: self.managerdata,name: "email")
                            
                        }
                    }
                }.padding(.top,10)
                .frame(width: 300, height: 500)
            }
        }
    }
}


    struct ManagerEditPracticeView: View {
        var managerdata : managerlist
            @State var edit = ""
            @State var showAlert = false
            @State var name : String

        var body: some View {
            VStack{
            Text("変更内容を入力して下さい")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color("green8"))
                
            TextField("変更内容", text: self.$edit)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("green8"))
                
            Button(action: {
                self.showAlert = true
                    let db = Firestore.firestore()
                    //試合申し込み完了テーブルに入れる
                    db.collection("managerlist")
                        .document(self.managerdata.email)
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

