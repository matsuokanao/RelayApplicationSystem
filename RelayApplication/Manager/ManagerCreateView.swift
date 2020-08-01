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
                
                Text("運営団体パスワード")
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
                        self.showAlert = true
                        let db = Firestore.firestore()
                        let data: [String : Any] = ["groupname": self.groupnum,"groupnum": self.groupnum, "grouppass": self.grouppass, "email": self.email]                        //試合申し込み完了テーブルに入れる
                        db.collection("managerlist")
                            .document(self.email)
                            .setData(data)
                                { (err) in
                                    if err != nil{
                                        print((err?.localizedDescription)!)
                                            return
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
                        Alert(title: Text("保存完了！"),
                              message: Text("内容を保存しました。"),
                              dismissButton: .default(Text("わかりました")))
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
