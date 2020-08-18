//
//  RelayOrderFinishView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/18.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct RelayOrderFinishView: View {
    @State var show = false
    var body: some View {
        VStack(spacing:10){
            Image("finishview")
                .resizable()
                .frame(width: 300.0 , height: 220.0)
                    Spacer().frame(height: 15)
                                       
        Text("オーダー提出完了！")
                .foregroundColor(Color("yello2"))
                .font(.title)
                .fontWeight(.bold)
                           
        Text("リレーオーダーの提出が完了しました。頑張って下さい！")
                .fontWeight(.bold)

                                               
            Button(action: {
                    //HOME画面遷移
                UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion:nil)
                        } ){
            Text("HOME画面に移動する")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 50)
                               }
                       .background(Color("yello2"))
                                   .cornerRadius(10)
                                   .padding(.top, 25)

                       }.frame(width: 300, height: 600)
                   }
               }



struct RelayOrderFinishView_Previews: PreviewProvider {
    static var previews: some View {
        RelayOrderFinishView()
    }
}
