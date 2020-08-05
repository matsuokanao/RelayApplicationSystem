//
//  ManagerCreateView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/28.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct ManagerCreateView: View {
    @State var showAlert = false
    //団体名
    @State var groupname = ""
    //団体番号
    @State var groupnum = ""
    //団体パスワード
    @State var grouppass = ""
    //メールアドレス
    @State var email = ""
    @State var title = ""
    @State var message = ""
    @State var dismissButton = ""
            
    var body: some View {

        ZStack{
                Color("green1")
                    .edgesIgnoringSafeArea(.all)
        //画面スクロール処理
        ScrollView(.vertical){
                
            VStack(alignment: .leading, spacing: 25){
                Text("運営団体情報")
                    .fontWeight(.bold)
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(.white)
                Text("・詳しい説明に関しましては大会関係者専用ページの「ページの説明」をご参照下さい")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Group{
                Text("運営団体名")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top,10)
                VStack{
                    TextField("団体", text: $groupname)
                        .foregroundColor(.white)
                        Divider()
                            .background(Color.white)
                        }
                
                Text("運営団体番号")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top,10)
                VStack{
                    TextField("登録陸連", text: $groupnum)
                        .keyboardType(.numberPad)
                        .foregroundColor(.white)
                        Divider()
                            .background(Color.white)
                        }
                
                Text("運営団体パスワード  4文字以上でご記入下さい")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top,10)
                VStack{
                    TextField("所属団体", text: $grouppass)
                        .foregroundColor(.white)
                        Divider()
                            .background(Color.white)
                        }
                
                Text("運営団体メールアドレス")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top,10)
                VStack{
                    TextField("代表者名", text: $email)
                        .foregroundColor(.white)
                        Divider()
                            .background(Color.white)
                        }
                    }
            
                HStack{
                        Spacer()
                    Button(action: {
                        if self.groupname == "" && self.groupnum == "" && self.grouppass == "" && self.email == ""  {
                        self.showAlert.toggle()
                            self.title = "エラー"
                            self.message = "全ての項目を入力して下さい。"
                            self.dismissButton = "OK"
                        }else if self.grouppass.count >= 4{
                            self.showAlert.toggle()
                            self.title = "エラー"
                            self.message = "パスワードは4文字以上入力して下さい。"
                            self.dismissButton = "OK"
                        }else{
                        self.showAlert.toggle()
                            self.title = "保存完了！"
                            self.message = "内容を保存しました。"
                            self.dismissButton = "OK"
                        let db = Firestore.firestore()
                        let data: [String : Any] = ["groupname": self.groupname,"groupnum": self.groupnum, "grouppass": self.grouppass, "email": self.email]                        //試合申し込み完了テーブルに入れる
                        db.collection("managerlist")
                            .document(self.groupname)
                            .setData(data)
                                { (err) in
                                    if err != nil{
                                        print((err?.localizedDescription)!)
                                            return
                                    }
                                }
                            }
                    }){
                        Text("登録する")
                            .fontWeight(.bold)
                            .foregroundColor(Color("green1"))
                            .padding(.vertical)
                            .padding(.horizontal,45)
                            .background(Color.white)
                            .clipShape(Capsule())
                            
                    
                    }.alert(isPresented: $showAlert){
                        Alert(title: Text(self.title),
                              message: Text(self.message),
                              dismissButton: .default(Text(self.dismissButton)))
                    }

                        Spacer()
                    }
                }
            }.frame(width: 350, height: 600)
        }
    }
}

struct ManagerCreateView_Previews: PreviewProvider {
    static var previews: some View {
        ManagerCreateView()
    }
}
