//
//  GameView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/23.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct GameView: View {
    @State var show = false
    @State var usereditshow = false
    @State var questionshow = false
    @State var timeshow = false

    var body: some View {
        VStack{
        ScrollView{
            HStack{
                Image(decorative:"cat2")
                    .resizable()    // 画像サイズをフレームサイズに合わせる
                .frame(width: 120, height: 100)
                Text("試合")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("blackcolor"))
                    
                Spacer(minLength: 0)
            }
            .padding(.horizontal)
                
        //1段目
        HStack{
            //ユーザー情報
            ZStack{
                RoundedRectangle(cornerRadius: 20,
                                 style: .continuous)
                    .fill(Color("blue1"))
                    .frame(width:170,height: 150)
                VStack{
                    Image(systemName: "flame.fill")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.12))
                            .clipShape(Circle())
                    Text("試合に申し込もう！")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width:170,height:60)
                            
            Button(action: {
                self.show.toggle()
            }){
                Text("申し込む")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .sheet(isPresented: $show){
                GameApplicationView()
                        }
                    }
                }
            }
                
        //ユーザー情報編集
    ZStack{
        RoundedRectangle(cornerRadius: 20,
                        style: .continuous)
                .fill(Color("blue2"))
                .frame(width:170,height: 150)
    VStack{
            Image(systemName: "book.fill")
                .foregroundColor(.white)
                .padding()
                .background(Color.white.opacity(0.12))
                .clipShape(Circle())
            Text("試合申し込みリスト")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width:170,height:60)
                                            
    Button(action: {
                    self.usereditshow.toggle()
                }){
        Text("開く")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .sheet(isPresented: $usereditshow){
                GameListView()
                }
            }
        }
    }
}
                
               //2段目
    HStack{
        //
        ZStack{
            RoundedRectangle(cornerRadius: 20,
                style: .continuous)
                    .fill(Color("blue3"))
                    .frame(width:170,height: 150)
    VStack{
        Image(systemName: "hare.fill")
            .foregroundColor(.white)
            .padding()
            .background(Color.white.opacity(0.12))
            .clipShape(Circle())
        Text("試合日記")
            .fontWeight(.bold)
            .foregroundColor(.white)
        Text("今日の試合は")
            .fontWeight(.bold)
            .foregroundColor(.white)
        Text("どうでしたか？")
            .fontWeight(.bold)
            .foregroundColor(.white)

    Button(action: {
            self.timeshow.toggle()
            }){
        Text("日記を書く")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .sheet(isPresented: $timeshow){
                TimeView()
            }
        }
    }
}
    ZStack{
        //
        RoundedRectangle(cornerRadius: 20,
                            style: .continuous)
                .fill(Color("blue4"))
                .frame(width:170,height: 150)
            VStack{
                Image(systemName: "questionmark.circle.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.white.opacity(0.12))
                                .clipShape(Circle())
            Text("分からない事がありますか？")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width:140,height:50)
        Button(action: {
                self.questionshow.toggle()
                }){
            Text("試合ページの説明")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .sheet(isPresented: $questionshow){
                    GameQuestionView()
                                }
                            }
                        }
                    }
                }
            }.padding(.top,30)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
