//
//  DiaryView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/26.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct DiaryView: View {
    @ObservedObject var authority = getAuthorityList()

    var body: some View {
        VStack{
            VStack{
                ForEach(self.authority.data,id: \.id){i in
                        DiaryCellView(authority: i)
                }
            }
        }
    }
}



struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}

struct DiaryCellView: View {
    @State var show = false
    var authority : authority
    
    //日記内容
    @State var diary = ""
    //日付　年
    @State var year = ""
    //日付　月
    @State var month = ""
    //日付　日
    @State var day = ""
    //天気
    @State var weather = ""
    //気持ち
    @State var mental = ""
    //大会名
    @State var tournamentname = ""

    var body: some View {
    VStack{
        VStack{
           Text("今日の陸上はどうでしたか？")
            .fontWeight(.bold)
            .foregroundColor(.white)
            Text("思った事を書き出してみましょう")
            .fontWeight(.bold)
            .foregroundColor(.white)
        }.frame(width:500,height: 100)
            .background(Color("whiteorange"))
        ScrollView{
            VStack(alignment: .leading, spacing: 20){
                HStack{
                Image(systemName: "calendar")
                        .foregroundColor(Color("whiteorange"))
                Text("日付")
                }
            HStack{
            TextField("", text: self.$year)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("whiteorange"))
            Text("年")
                
            TextField("", text: self.$month)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("whiteorange"))
            Text("月")
                
            TextField("", text: self.$day)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("whiteorange"))
            Text("日")
                    }
                }
            }.frame(width: 300, height: 600)
        }
    }
}

  
