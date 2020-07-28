//
//  DiaryListView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/27.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct DiaryListView: View {
    @ObservedObject var authority = getAuthorityList()
    @ObservedObject var diarydata = getDiaryList()
    //日付　年
    @State var year = ""
    //日付　月
    @State var month = ""
    //日付　日
    @State var day = ""
    
        var body: some View {
            ZStack{
            Color("whiteorange")
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                Text("日付の日付を入力して下さい")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                HStack{
                    TextField("", text: self.$year)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(Color("whiteorange"))
                    Text("年")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)

                                   
                    TextField("", text: self.$month)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(Color("whiteorange"))
                    Text("月")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)

                                   
                    TextField("", text: self.$day)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(Color("whiteorange"))
                Text("日")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)

                }

                        ForEach(self.authority.data,id: \.id){i in
                        List(self.diarydata.data,id: \.id){d in
                            DiaryListCellView(diary: d, authority: i, year: self.year, month: self.month, day: self.day)
                }.padding(.top,20)
            }
        }.frame(width: 300, height: 600)
    }
}

struct DiaryListVIew_Previews: PreviewProvider {
    static var previews: some View {
        DiaryListView()
    }
}

struct DiaryListCellView: View {
    var diary : diarylist
    var authority : authority
    var year : String
    var month : String
    var day : String
    @State var show = false
    
    var body: some View {
        VStack{
            if authority.email == diary.email {
            if diary.year == self.year {
                HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(Color("whiteorange"))
                                Text(diary.diary)
                    Spacer()
                    Button(action: {
                        self.show.toggle()
                            }) {
                    Image(systemName: "play.fill")
                            .foregroundColor(Color("whiteorange"))
                            }.sheet(isPresented: self.$show) {
                                DiaryListOpenView(diary: self.diary)                    }
                }
                
                
            } else if diary.month == self.month{
                HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(Color("whiteorange"))
                Text(diary.diary)
                    Spacer()
                Button(action: {
                        self.show.toggle()
                            }) {
                Image(systemName: "play.fill")
                    .foregroundColor(Color("whiteorange"))
                        }.sheet(isPresented: self.$show) {
                    DiaryListOpenView(diary: self.diary)                    }
                    }
                
                
                } else if diary.day == self.day {
                HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(Color("whiteorange"))
                Text(diary.diary)
                    Spacer()
                Button(action: {
                        self.show.toggle()
                            }) {
                Image(systemName: "play.fill")
                    .foregroundColor(Color("whiteorange"))
                        }.sheet(isPresented: self.$show) {
                    DiaryListOpenView(diary: self.diary)                    }
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
                    .foregroundColor(Color("whiteorange"))
            Text("日付")
            }
            HStack{
                Text(diary.year)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("whiteorange"))
        Text("年")
            
                Text(diary.month)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("whiteorange"))
        Text("月")
            
                Text(diary.day)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("whiteorange"))
        Text("日")
                }
        HStack{
            Image(systemName: "sun.max.fill")
                    .foregroundColor(Color("whiteorange"))
        Text("天気")
            Text(diary.weather)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("whiteorange"))
          
            
        Image(systemName: "heart.fill")
            .foregroundColor(Color("whiteorange"))
        Text("気持ち")
            Text(diary.mental)
            .keyboardType(.numberPad)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .background(Color("whiteorange"))
                }
        HStack{
            Image(systemName: "sparkles")
            .foregroundColor(Color("whiteorange"))
            Text("項目（大会名や題名など）")
            }
            
            
        VStack{
            Text(diary.tournamentname)
            .keyboardType(.numberPad)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .background(Color("whiteorange"))
            }
            HStack{
                Image(systemName: "book.fill")
                .foregroundColor(Color("whiteorange"))
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
