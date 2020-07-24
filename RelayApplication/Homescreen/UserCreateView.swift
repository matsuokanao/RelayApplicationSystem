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
    //パスワード
    @State var UserPass = ""

    @State var color = Color.black.opacity(0.7)
    
    @State var show = false
    
    var body: some View {

        ZStack{
            Color("red")
            .edgesIgnoringSafeArea(.all)
    //画面スクロール処理
    ScrollView(.vertical){
        
    VStack(alignment: .leading, spacing: 25){
        Text("User Data")
            .fontWeight(.bold)
            .font(.system(size: 35, weight: .bold))
            .foregroundColor(.white)
        Group{
        Text("名前")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(.top,10)
        VStack{
            TextField("名前", text: $UserName)
                Divider()
                    .background(Color.white)
                }
        
        Text("登録陸連")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top,10)
        VStack{
            TextField("登録陸連", text: $Jaaf)
                Divider()
                    .background(Color.white)
                }
        
        Text("所属団体")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top,10)
        VStack{
            TextField("所属団体", text: $Belong)
                Divider()
                    .background(Color.white)
                }
        
        Text("所属団体代表者名")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top,10)
        VStack{
            TextField("代表者名", text: $Ceo)
                Divider()
                    .background(Color.white)
                }
            }
        
        Text("メールアドレス　*ご自身の連絡の取れるメールアドレスを入力して下さい")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top,10)
        VStack{
            TextField("メールアドレス", text: $Email)
                Divider()
                    .background(Color.white)
                }
        
        Text("電話番号　*ご自身の連絡の取れる電話番号を入力して下さい")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top,10)
        VStack{
            TextField("電話番号電話", text: $PhoneNumber).keyboardType(.numberPad)
                Divider()
                    .background(Color.white)
                }

        Text("最後に試合登録、閲覧等に使用するパスワードを入力して下さい　*6文字以上で入力して下さい")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top,10)
        VStack{
            TextField("パスワード", text: $UserPass)
                Divider()
                    .background(Color.white)
                }

        HStack{
                Spacer()
            Button(action: {
                self.show.toggle()
                let db = Firestore.firestore()
                let data: [String : Any] = ["username":self.UserName, "email":self.Email]
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
                    .foregroundColor(Color("red"))
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
            }
        }
    }
}

struct UserCreateView_Previews: PreviewProvider {
    static var previews: some View {
        UserCreateView()
    }
}


