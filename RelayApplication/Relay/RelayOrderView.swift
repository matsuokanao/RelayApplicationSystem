//
//  RelayOrderView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/02.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct RelayOrderView: View {
    @ObservedObject var data = getRelayCompleteList()
    @State var email = ""
    @State var pass =   ""
    var body: some View {
        ZStack{
                Color("yello2")
                        .edgesIgnoringSafeArea(.all)
        VStack(alignment: .leading){
            Text("試合申し込み時に入力したユーザーパスとメールアドレスを入力して下さい")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)

            Text("メールアドレス")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .padding(.top,20)

            TextField("メールアドレス", text: self.$email)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("yello2"))
                        
            Text("ユーザーパス")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .padding(.top,20)

            TextField("ユーザーパス", text: self.$pass)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .background(Color("yello2"))

        ForEach(self.data.data,id: \.id){i in
            CellRelayListView(relaylist: i, pass: self.pass, email: self.email)
                        }
                    }.frame(width: 300, height: 600)
                }
            }
        }


struct RelayOrderView_Previews: PreviewProvider {
    static var previews: some View {
        RelayOrderView()
    }
}
