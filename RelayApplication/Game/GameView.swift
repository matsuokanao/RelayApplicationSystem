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
    @State var diaryshow = false

    var body: some View {
        VStack{
        ScrollView{
            HStack{
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
        Text("記録表")
            .fontWeight(.bold)
            .foregroundColor(.white)
        Text("試合の結果を")
            .fontWeight(.bold)
            .foregroundColor(.white)
        Text("まとめよう")
            .fontWeight(.bold)
            .foregroundColor(.white)

    Button(action: {
            self.diaryshow.toggle()
            }){
        Text("開く")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .sheet(isPresented: $diaryshow){
                DiaryView()
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
                self.diaryshow.toggle()
                }){
            Text("試合ページの説明")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .sheet(isPresented: $diaryshow){
                    DiaryView()
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
