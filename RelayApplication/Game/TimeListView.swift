//
//  TimeListView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/01.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct TimeListView: View {
    @ObservedObject var timadata = getTimeList()
    //日付　年
    @State var year = ""
    //日付　月
    @State var month = ""
    //日付　日
    @State var day = ""
    @State var email = ""
    @State var pass = ""
    @State var event = ""

    var body: some View {
        
    ZStack{
            Color("blue3")
                    .edgesIgnoringSafeArea(.all)
        VStack(alignment: .leading){
            Text("ユーザーのメールアドレスを入力して下さい")
                .foregroundColor(Color.white)
                .fontWeight(.bold)
            TextField("", text: self.$email)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("blue3"))
                        
            Text("ユーザーパスを入力して下さい")
                .foregroundColor(Color.white)
                .fontWeight(.bold)
            TextField("", text: self.$pass)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("blue3"))

              Text("種目を入力して下さい")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                     
            TextField("", text: self.$event)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("blue3"))
            
            Text("日付の日付を入力して下さい")
                .foregroundColor(Color.white)
                .fontWeight(.bold)
        HStack{
            TextField("", text: self.$year)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("blue3"))
            Text("年")
                .foregroundColor(Color.white)
                .fontWeight(.bold)

                                           
            TextField("", text: self.$month)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("blue3"))
            Text("月")
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                        }

            ForEach(self.timadata.data,id: \.id){i in
                CellTimeListView(time: i, year: self.year, month: self.month, email: self.email, pass: self.pass,event:self.event)
                        
                    }.padding(.top,20)
                    }.frame(width: 300, height: 600)
                }
            }
        }

struct TimeListView_Previews: PreviewProvider {
    static var previews: some View {
        TimeListView()
    }
}



struct CellTimeListView: View {
    var time : timelist
    var year : String
    var month : String
    var email : String
    var pass : String
    var event : String

var body: some View {
    VStack{
        if event == time.event || year == time.year && month == time.month{
            Text("aaa")
            }
        }
    }
}
