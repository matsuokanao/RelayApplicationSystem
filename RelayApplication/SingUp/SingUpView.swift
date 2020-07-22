//
//  SingUpView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/21.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct SingUpView: View {
    
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @State var visible = false
    @State var revisible = false
    @Binding var show : Bool
    @State var first = "first"
    @State var alert = false
    @State var error = ""
    
    var body: some View {
        ZStack{
                    
            ZStack(alignment: .topLeading) {
                GeometryReader{_ in
                    VStack{
                        Image("runcatview")
                            .resizable()
                            .frame(width: 200.0 , height: 200.0)
                        Text("アカウント新規作成")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("whiteorange"))
                       
            HStack {
                Image(systemName: "envelope")
                    TextField("メールアドレス", text: self.$email)
                    }
            //自動大文字入力制御
                    .autocapitalization(.none)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("darkorange") : (Color("blackcolor")),lineWidth:  2))
                    .background(Color("darkwhiteyellow"))
                    .padding(.top, 25)
                        
                        
                        
            HStack(spacing: 15){
                HStack {
                    Image(systemName: "questionmark")
                        VStack{
                            if self.visible{
                                TextField("パスワード", text:  self.$pass)
                                .autocapitalization(.none)

                            }else{
                                SecureField("パスワード", text: self.$pass)
                                .autocapitalization(.none)

                                }
                            }
                        }
                            Button(action: {
                                //クリックによってパスワードを表示
                                self.visible.toggle()
                                }) {
                                    Image(systemName: self.visible ? "eye.slash.fill": "eye.fill")
                                        .foregroundColor(Color("blackcolor"))
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("darkorange") : (Color("blackcolor")),lineWidth:  2))
                        .background(Color("darkwhiteyellow"))
                        .padding(.top, 25)
                        
                HStack {
                    Image(systemName: "questionmark")
                        
                    HStack(spacing: 15){
                         VStack{
                         if self.revisible{
                             TextField("再入力", text:  self.$repass)
                            .autocapitalization(.none)

                         }else{
                             SecureField("再入力", text: self.$repass)
                            .autocapitalization(.none)

                             }
                         }
                    }
                         Button(action: {
                             //クリックによってパスワードを表示
                             self.revisible.toggle()
                             }) {
                                 Image(systemName: self.revisible ? "eye.slash.fill": "eye.fill")
                                     .foregroundColor(Color("blackcolor"))
                         }
                     }
                     .padding()
                     .background(RoundedRectangle(cornerRadius: 4).stroke(self.repass != "" ? Color("darkorange") : (Color("blackcolor")),lineWidth:  2))
                    .background(Color("darkwhiteyellow"))
                     .padding(.top, 25)

                      //登録ボタンアクション
                        Button(action: {
                            self.register()
                        }){
                            Text("新規登録")
                                .foregroundColor(Color("blackcolor"))
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color("darkwhiteyellow"))
                        .cornerRadius(40)
                        .padding(.top, 25)
                        }
                        .padding(.horizontal, 25)
                        }
                        
                        Button(action: {
                            self.show.toggle()
                        })  {
                           Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(Color("blackcolor"))
                        }
                    .padding()
                    }
                    
                    if self.alert{
                        
                        Text(self.error)
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
          //登録ボタンを押した時の処理
            func register(){
                if self.email != "" {
                    
                    if self.pass == self.repass{
                        
                        Auth.auth().createUser(withEmail: self.email, password: self.pass){
                            (res, err) in
                            print("成功しました")
                            UserDefaults.standard.set(true, forKey: "status")
                            NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                        }
                    }
                    else{
                        self.error = "パスワードが一致していません"
                        self.alert.toggle()
                    }
                }
        else{
            self.error = "すべての項目を入力してください"
            self.alert.toggle()
        }
    }
}


struct SingUpView_Previews: PreviewProvider {
    static var previews: some View {
        SingUpView(show: .constant(false))
    }
}
