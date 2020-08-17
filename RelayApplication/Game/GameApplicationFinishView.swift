//
//  GameApplicationFinishView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/31.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct GameApplicationFinishView: View {
        @State var show = false
        var body: some View {
            VStack(spacing:10){
                Image("finishview")
                    .resizable()
                    .frame(width: 300.0 , height: 220.0)
                        Spacer().frame(height: 15)
                            
                Text("申し込み完了！！")
                    .foregroundColor(Color("blue1"))
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("・試合の申し込みが完了しました。")
                    .fontWeight(.bold)
                Text("・試合内容は「試合ページ」の「試合申し込みリスト」で確認できます。")
                    .fontWeight(.bold)
                Text("試合費用をお支払いしてエントリー完了となります。お支払いが確認できない場合は自動キャンセルとなりますのでご注意下さい。")
                    .foregroundColor(.red)
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
            .background(Color("blue1"))
                        .cornerRadius(10)
                        .padding(.top, 25)

                }.frame(width: 300, height: 600)
        }
    }

struct GameApplicationFinishView_Previews: PreviewProvider {
    static var previews: some View {
        GameApplicationFinishView()
    }
}
