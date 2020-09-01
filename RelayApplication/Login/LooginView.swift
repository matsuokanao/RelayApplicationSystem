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
    @State var email = ""
    @State var pass = ""
    @State var visible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    @ObservedObject var keyboard = KeyboardObserver()
    
    var body: some View {
        ZStack{
            
            ZStack(alignment: .topTrailing) {
                GeometryReader{_ in
                    
                    VStack{
                        Image("top")
                            .resizable()
                            .frame(width: 300.0 , height: 200.0)
                        Text("メールでログイン")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("yello1"))
                        
                        HStack {
                            Image(systemName: "envelope")
                            
                            TextField("メールアドレス", text: self.$email)
                                .foregroundColor(Color("blackcolor"))
                        }
                            //自動大文字入力制御
                            .autocapitalization(.none)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("yello1") : (Color("blackcolor")),lineWidth:  2))
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
                        .background(RoundedRectangle(cornerRadius: 5).stroke(self.pass != "" ? Color("yello1") : (Color("blackcolor")),lineWidth:  2))
                            
                        .padding(.top, 10)
                        
                        //パスワード再設定処理
                        HStack{
                            Spacer()
                            Button(action: {
                                self.reset()
                            })  {
                                Text("パスワードを忘れました")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("blackcolor"))
                            }
                        }
                        .padding(.top,10)
                        
                        Button(action: {
                            self.verify()
                        }){
                            Text("ログイン")
                                .foregroundColor(Color("blackcolor"))
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color("yello1"))
                        .cornerRadius(30)
                        .padding(.top, 10)
                    }
                    .padding(.horizontal, 25)
                }
                
                Text("アカウントをお持ちでないですか？")
                    
                    .fontWeight(.bold)
                    .foregroundColor(Color("blackcolor"))
                Button(action: {
                    self.show.toggle()
                })  {
                    Text("新規作成")
                        .fontWeight(.bold)
                        .foregroundColor(Color("yello1"))
                        .padding(.top, 10)
                }.padding()
            }
            if self.alert{
                ErrorView(alert: self.$alert, error: $error)
            }
        }.onAppear{
            self.keyboard.startObserve()
        }.onDisappear{
            self.keyboard.stopObserve()
        }.padding(.bottom, keyboard.keyboardHeight)
    }
    //エラー分岐
    func verify(){
        if self.email != "" && self.pass != "" {
            //メールアドレスとパスワードを送る
            Auth.auth().signIn(withEmail: self.email, password: self.pass) { (res,err) in
                if err == nil {
                    if err != nil {
                        self.error = ""
                        self.alert.toggle()
                        return
                    }
                    print("成功！！")
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"),object: nil)
                }else{
                    self.error = "エラーが発生しました。メールアドレス、パスワードが正しいか再度ご確認下さい。"
                    self.alert.toggle()
                    
                }
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


//エラー処理
struct  ErrorView : View {
    @State var color = Color.black.opacity(0.7)
    @Binding var alert : Bool
    @Binding var error : String
    
    var body: some View {
        
        GeometryReader{_ in
            VStack{
                HStack{
                    Text(self.error == "REST" ? "Message" :"エラー")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    Spacer()
                }
                .padding(.horizontal, 25)
                
                Text(self.error == "REST" ? "入力したメールアドレスにパスワードのリセットURLを送信しました" : self.error)
                    .padding(.horizontal, 25)
                    .padding(.top)
                    .padding(.horizontal,25)
                
                Button(action: {
                    //エラ-をキャンセルボタンで消す
                    self.alert.toggle()
                }) {
                    Text(self.error == "REST" ? "OK" : "戻る")
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }
                .background(Color.white)
                .cornerRadius(10)
                .padding(.top, 25)
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(15)
        }
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
    }
}
