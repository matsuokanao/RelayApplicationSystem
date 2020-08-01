//
//  DiaryListView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/27.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct DiaryListView: View {
    @ObservedObject var diarydata = getDiaryList()
    //日付　年
    @State var year = ""
    //日付　月
    @State var month = ""
    //日付　日
    @State var day = ""
    @State var email = ""
    @State var pass = ""
    
        var body: some View {
            ZStack{
            Color("red3")
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                Text("ユーザーのメールアドレスを入力して下さい")
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                TextField("", text: self.$email)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("red3"))
                
            Text("ユーザーパスを入力して下さい")
                .foregroundColor(Color.white)
                .fontWeight(.bold)
            TextField("", text: self.$pass)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("red3"))

                
                Text("日付の日付を入力して下さい")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                HStack{
                    TextField("", text: self.$year)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(Color("red3"))
                    Text("年")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)

                                   
                    TextField("", text: self.$month)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(Color("red3"))
                    Text("月")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)

                }

            ForEach(self.diarydata.data,id: \.id){i in
                DiaryListCellView(diary: i, year: self.year, month: self.month, email: self.email, pass: self.pass)
                
            }.padding(.top,20)
            }.frame(width: 300, height: 600)
        }
    }
}

struct DiaryListVIew_Previews: PreviewProvider {
    static var previews: some View {
        DiaryListView()
    }
}

struct DiaryListCellView: View {
    var diary : diarylist
    var year : String
    var month : String
    var email : String
    var pass : String
    
    @State var show = false
    
    var body: some View {
        VStack{
            if email == diary.email && pass == diary.userpass {
                if diary.year == self.year && diary.month == self.month {
                HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(Color.white)
            Text(diary.month)
                .foregroundColor(Color.white)
                .fontWeight(.bold)
            Text("月")
                .foregroundColor(Color.white)
                .fontWeight(.bold)
            Text(diary.day)
                .foregroundColor(Color.white)
                .fontWeight(.bold)
            Text("日")
                .foregroundColor(Color.white)
                .fontWeight(.bold)
            Text(diary.tournamentname)
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                    
                    Spacer()
                    Button(action: {
                        self.show.toggle()
                            }) {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color.white)
                            }.sheet(isPresented: self.$show) {
                                DiaryListOpenView(diary: self.diary)
                        }
                    }
                }
            }
        }
    }
}


struct DiaryListOpenView: View {
    var diary : diarylist
        var body: some View {
        ScrollView{
        VStack(spacing: 20){
            HStack{
            Image(systemName: "calendar")
                .foregroundColor(Color("red3"))
            Text("日付")
            }
            HStack{
                Text(diary.year)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("年")
            
                Text(diary.month)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())

        Text("月")
            
                Text(diary.day)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())

        Text("日")
                }
        HStack{
            Image(systemName: "sun.max.fill")
                    .foregroundColor(Color("red3"))
        Text("天気")
            Text(diary.weather)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
        Image(systemName: "heart.fill")
            .foregroundColor(Color("red3"))
        Text("気持ち")
            Text(diary.mental)
            .keyboardType(.numberPad)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
                }
        HStack{
            Image(systemName: "sparkles")
            .foregroundColor(Color("red3"))
            Text("項目（大会名や題名など）")
            }
            
            
        VStack{
            Text(diary.tournamentname)
            .keyboardType(.numberPad)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack{
                Image(systemName: "book.fill")
                .foregroundColor(Color("red3"))
                Text("気持ち")
                }
            VStack{
                Text(diary.diary)
                .frame(width: UIScreen.main.bounds.width * 0.8, height: 500)
                .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black))
                    
                }
            }
        }.frame(width: 300, height: 600)
    }
}
