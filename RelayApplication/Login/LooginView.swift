//
//  LooginView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/21.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct LooginView: View {
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var visible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""

    var body: some View {
        ZStack{
                ZStack(alignment: .topTrailing) {
                    GeometryReader{_ in
                
                VStack{
                    Image("loginview")
                        .resizable()
                        .frame(width: 300.0 , height: 180.0)
                    Text("おかえりなさい")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                    Text("--ログインしてください--")
                        .foregroundColor(self.color)
                        .padding(.top, 10)
                    
                    TextField("メールアドレス", text: self.$email)
                        //自動大文字入力制御
                        .autocapitalization(.none)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("PinkRed") : self.color,lineWidth:  2))
                        .padding(.top, 25)
                    
                    HStack(spacing: 15){
                        
                        VStack{
                            
                        if self.visible{
                            TextField("パスワード", text:  self.$pass)
                            .autocapitalization(.none)

                        }else{
                            SecureField("パスワード", text: self.$pass)
                            .autocapitalization(.none)

                            }
                        }
                        Button(action: {
                            //クリックによってパスワードを表示
                            self.visible.toggle()
                            }) {
                                Image(systemName: self.visible ? "eye.slash.fill": "eye.fill")
                                    .foregroundColor(self.color)
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("PinkRed") : self.color,lineWidth:  2))
                    .padding(.top, 25)
                    
                    //パスワード再設定処理
                    HStack{
                        Spacer()
                        Button(action: {
                            self.reset()
                            })  {
                            Text("パスワードを忘れました")
                                .fontWeight(.bold)
                                .foregroundColor(Color("PinkRed"))
                        }
                    }
                    .padding(.top,20)
                    
                    Button(action: {
                        self.verify()
                    }){
                        Text("ログイン")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 50)
                    }
                    .background(Color("PinkRed"))
                    .cornerRadius(10)
                    .padding(.top, 25)
                    }
                    .padding(.horizontal, 25)
                    }
                    
                    Button(action: {
                        self.show.toggle()
                    })  {
                        Text("アカウントを作成する")
                                .fontWeight(.bold)
                                .foregroundColor(Color("PinkRed"))
                    }
                .padding()
                }
                
                if self.alert{
                    Text("aaa")
                    }
                }
            }
            //エラー分岐
            func verify(){
                if self.email != "" && self.pass != "" {
                    //メールアドレスとパスワードを送る
                    Auth.auth().signIn(withEmail: self.email, password: self.pass) { (res,err) in
                        if err != nil {
                            self.error = ""
                            self.alert.toggle()
                            return
                        }
                        print("成功！！")
                        UserDefaults.standard.set(true, forKey: "status")
                        NotificationCenter.default.post(name: NSNotification.Name("status"),object: nil)
                    }
                    
                }else{
                    self.error = "すべての項目を埋めてください"
                    self.alert.toggle()
                }
            }
            
            //パスワード再設定
            func reset(){
                if self.email != "" {
                    
                    Auth.auth().sendPasswordReset(withEmail: self.email) { (err) in
                        if err != nil{
                            
                            self.error = err!.localizedDescription
                            self.alert.toggle()
                            return
                        }
                        
                        self.error = "REST"
                        self.alert.toggle()
                    }
                }
                else{
                    self.error = "正しいメールアドレスを入力してください"
                    self.alert.toggle()
                }
            }
        }


struct LooginView_Previews: PreviewProvider {
    static var previews: some View {
        LooginView(show: .constant(false))
    }
}
