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
    @ObservedObject var authority = getAuthorityList()
    @ObservedObject var data = getManagerList()
    var body: some View {
        VStack{
            ForEach(self.data.data,id: \.id){i in
                    ForEach(self.authority.data,id: \.id){a in
                CellManagerEditView(authority: a, managerdata: i)
                }
            }
        }
    }
}

struct ManagerEditView_Previews: PreviewProvider {
    static var previews: some View {
        ManagerEditView()
    }
}

struct CellManagerEditView: View {
    var authority :authority
    var managerdata :managerlist
    @State var show = false
    
    var body: some View {
        VStack{
        if authority.email == managerdata.email{
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
                }
            }
        }
    }
}


    struct ManagerEditPracticeView: View {
        var managerdata : managerlist
            @State var edit = ""
            @State var show = false
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
                self.show.toggle()
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
                Text("編集する")
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 30)
                    .sheet(isPresented: $show){
                        UserEditFinishView()
                                }
                            }.background(Color("green8"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                }.frame(width: 300, height: 500)
            }
        }

