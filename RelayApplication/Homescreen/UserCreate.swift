//
//  UserCreate.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/23.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct UserCreate: View {
    @State var username = ""
    @State var email = ""
    @State var color = Color.black.opacity(0.7)
    @State var show = false
    var body: some View {
        VStack{
        Text("試合会場")
            TextField("試合会場を入力して下さい",text: $username)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.username != "" ? Color("blackcolor") : self.color,lineWidth:  2))
            Text("試合会場")
            TextField("試合会場を入力して下さい",text: $email)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("blackcolor") : self.color,lineWidth:  2))
            
            Button(action: {
                self.show.toggle()
                let db = Firestore.firestore()
                //試合申し込み完了テーブルに入れる
                db.collection("userlist")
                    .document(self.email)
                    .setData(["username":self.username, "email":self.email])
                        { (err) in
                            if err != nil{
                                print((err?.localizedDescription)!)
                                    return
                        }
                    }
            }){
                Text("aa")
                .sheet(isPresented: $show){
                Homescreen()
                }
            }
        }
    }
}

struct UserCreate_Previews: PreviewProvider {
    static var previews: some View {
        UserCreate()
    }
}
