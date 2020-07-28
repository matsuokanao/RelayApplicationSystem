//
//  UserCreateView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/23.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase


struct UserCreateView: View {
    //名前
    @State var UserName = ""
    //登録陸連
    @State var Jaaf = ""
    //所属名
    @State var Belong = ""
    //代表者名
    @State var Ceo = ""
    //メールアドレス
    @State var Email = ""
    //電話番号
    @State var PhoneNumber = ""
    //ユーザーパスワード
    @State var UserPass = ""
    //団体パスワード
    @State var BelongPass = ""

    @State var color = Color.black.opacity(0.7)
    
    @State var show = false
    
    var body: some View {

        ZStack{
            Color("red1")
            .edgesIgnoringSafeArea(.all)
    //画面スクロール処理
    ScrollView(.vertical){
        
    VStack(alignment: .leading, spacing: 25){
        Text("User Data")
            .fontWeight(.bold)
            .font(.system(size: 35, weight: .bold))
            .foregroundColor(.white)
        Text("・所属団体パスワード,試合パスワードの詳しい説明に関しましてはHOME画面の良くある質問をご参照下さい")
            .fontWeight(.bold)
            .foregroundColor(.white)
        Group{
        Text("名前")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(.top,10)
        VStack{
            TextField("名前", text: $UserName)
                .foregroundColor(.white)
                Divider()
                    .background(Color.white)
                }
        
        Text("登録陸連")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top,10)
        VStack{
            TextField("登録陸連", text: $Jaaf)
                .foregroundColor(.white)
                Divider()
                    .background(Color.white)
                }
        
        Text("所属団体")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top,10)
        VStack{
            TextField("所属団体", text: $Belong)
                .foregroundColor(.white)
                Divider()
                    .background(Color.white)
                }
        
        Text("所属団体代表者名")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top,10)
        VStack{
            TextField("代表者名", text: $Ceo)
                .foregroundColor(.white)
                Divider()
                    .background(Color.white)
                }
            }
    Group{
        Text("メールアドレス　*ご自身の連絡の取れるメールアドレスを入力して下さい")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top,10)
        VStack{
            TextField("メールアドレス", text: $Email)
                .foregroundColor(.white)
                Divider()
                    .background(Color.white)
                }
        
        Text("電話番号　*ご自身の連絡の取れる電話番号を入力して下さい")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top,10)
        VStack{
            TextField("電話番号電話", text: $PhoneNumber)
                .keyboardType(.numberPad)
                .foregroundColor(.white)
                Divider()
                    .background(Color.white)
                }
        
        Text("所属団体パスワードを入力する")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(.top,10)
        VStack{
        TextField("所属団体パスワード", text: $BelongPass)
            .foregroundColor(.white)
            Divider()
                .background(Color.white)
            }


        Text("試合パスワードを入力して下さい　*6文字以上で入力して下さい")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top,10)
        VStack{
            TextField("パスワード", text: $UserPass)
                .foregroundColor(.white)
                Divider()
                    .background(Color.white)
                }
            }

        HStack{
                Spacer()
            Button(action: {
                self.show.toggle()
                let db = Firestore.firestore()
                let data: [String : Any] = ["username": self.UserName, "jaaf": self.Jaaf, "belong": self.Belong, "ceo": self.Ceo, "email": self.Email, "phonenumber": self.PhoneNumber, "userpass": self.UserPass, "belongpass": self.BelongPass]
                //試合申し込み完了テーブルに入れる
                db.collection("userlist")
                    .document(self.Email)
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
                    .foregroundColor(Color("red1"))
                    .padding(.vertical)
                    .padding(.horizontal,45)
                    .background(Color.white)
                    .clipShape(Capsule())
                    
                .sheet(isPresented: $show){
                    UserCreateFinishView()
            
                            }
                        }
                        Spacer()
                    }
                }
            }.frame(width: 350, height: 600)
        }
    }
}

struct UserCreateView_Previews: PreviewProvider {
    static var previews: some View {
        UserCreateView()
    }
}


