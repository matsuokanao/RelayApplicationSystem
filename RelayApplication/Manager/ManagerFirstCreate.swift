//
//  ManagerFirstCreate.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/08.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct ManagerFirstCreate: View {
   var body: some View {
    VStack{
        ScrollView{
            VStack{
                
                Text("大会関係者")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .font(.title)
                Text("申し込みページ")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .font(.title)
                }.frame(width:400,height: 100)
                .background(Color("green4"))
            Group{
                Text("お申込みは１団体につき代表者様１名が行って下さい。")
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .font(.title)
                    .padding(.top,30)
                    .frame(width:300,height: 150)
                
                Text("お申し込み前に")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.title)
                    .padding(.top,30)
                Text("準備して下さい。")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.title)
                
                Text("(１)本人確認書類")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.title)
                    .padding(.top,30)
                Text("JAAF公認書類")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top,20)
                    .font(.title)

                Text("・スマートフォンからお申し込みの場合はスマートフォンのカメラで撮影して下さい。")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top,10)
                    .frame(width:300,height: 80)
                Text("・パソコンからお申し込みの場合はデジタルカメラで撮影、またはスキャナーなどで読み取って下さい。")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top,10)
                    .frame(width:300,height: 80)
                Text("・お申し込み書類に不備がございますとお申し込みはキャンセルとなります。ご注意下さい。")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top,10)
                    .frame(width:300,height: 80)
                Text("本人確認書類一覧")
                .fontWeight(.bold)
                .foregroundColor(Color("green4"))
                .padding(.top,10)
            HStack{
                Image(systemName: "1.circle.fill")
                .foregroundColor(Color("green4"))
                    Text("運転免許書")
                        .fontWeight(.bold)
                }
            }
    Group{
            HStack{
            Image(systemName: "2.circle.fill")
            .foregroundColor(Color("green4"))
                Text("住民基本台帳カード")
                .fontWeight(.bold)
            }
            HStack{
            Image(systemName: "3.circle.fill")
            .foregroundColor(Color("green4"))
                Text("マイナンバーカード")
                .fontWeight(.bold)
                    }
                
            Text("(２)連絡先メールアドレス")
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top,20)
                .font(.title)
            Text("・必ず本人と連絡の取れる連絡先を入力して下さい。")
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top,10)
                .frame(width:300,height: 80)
                }
            
    Group{

            Text("利用までの流れ")
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top,20)
                .font(.title)
        
            HStack{
            Image(systemName: "1.circle.fill")
                .foregroundColor(Color("green4"))
                
            Text("本人確認書類,JAAF公認書類を指定のメールアドレスに送信して下さい。")
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top,10)
                .frame(width:300,height: 80)
                    }
        Text("指定のメールアドレス　　*****@gmail.com")
            .fontWeight(.bold)
        HStack{
        Image(systemName: "2.circle.fill")
            .foregroundColor(Color("green4"))
            
        Text("審査完了後「登録完了のお知らせ」メールが届きます。その後、本部より書類が届きますのでお待ち下さい。")
            .fontWeight(.bold)
            .foregroundColor(.black)
            .padding(.top,10)
            .frame(width:300,height: 80)
                }
        
        HStack{
        Image(systemName: "3.circle.fill")
            .foregroundColor(Color("green4"))
            
        Text("郵送された書類の指示に沿って設定を行って下さい。")
            .fontWeight(.bold)
            .foregroundColor(.black)
            .padding(.top,10)
            .frame(width:300,height: 80)
                }


                }
            }
        }.frame(width:300,height: 600)

    }
}

struct ManagerFirstCreate_Previews: PreviewProvider {
    static var previews: some View {
        ManagerFirstCreate()
    }
}
