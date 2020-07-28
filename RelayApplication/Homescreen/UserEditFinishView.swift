//
//  UserEditFinishView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/26.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct UserEditFinishView: View {
    @State var show = false
        var body: some View {
            VStack(spacing:10){
                Image("finishview")
                    .resizable()
                    .frame(width: 300.0 , height: 220.0)
                        Spacer().frame(height: 15)
                            
            Text("編集完了！！")
                .foregroundColor(Color("red2"))
                .font(.title)
                .fontWeight(.bold)
                
            Text("・編集したユーザーの情報はHOME画面の「ユーザー情報確認画面」にてご確認できます。")
                .fontWeight(.bold)
            Text("トラブル防止の為、パスワードの管理には十分お気をつけください。また、パスワードは定期的にご変更ください。")
                .foregroundColor(Color("red2"))
                .fontWeight(.bold)

                                    
        Button(action: {
            //HOME画面遷移
                UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
                        } ){
            Text("HOME画面に移動する")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 50)
            }
            .background(Color("red2"))
            .cornerRadius(10)
            .padding(.top, 25)

        }.frame(width: 300, height: 600)
    }
}

struct UserEditFinishView_Previews: PreviewProvider {
    static var previews: some View {
        UserEditFinishView()
    }
}
