//
//  managerView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/21.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct ManagerView: View {
    @State var show = false
    @State var usereditshow = false
    @State var diaryshow = false
    var body: some View {
        VStack{
            HStack{
                Text("HOME")
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
                .fill(Color("red"))
                .frame(width:170,height: 150)
        VStack{
            Image(systemName: "faceid")
                .foregroundColor(.white)
                .padding()
                .background(Color.white.opacity(0.12))
                                    .clipShape(Circle())
            Text("まずは自分の情報を登録しましょう")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width:170,height:60)
                                    
        Button(action: {
                        self.show.toggle()
                    }){
            Text("ユーザー登録")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .sheet(isPresented: $show){
            UserCreateView()
            }
        }
    }
}
                        
                //ユーザー情報編集
    ZStack{
        RoundedRectangle(cornerRadius: 20,
                         style: .continuous)
            .fill(Color("skyblue"))
            .frame(width:170,height: 150)
    VStack{
        Image(systemName: "book.fill")
            .foregroundColor(.white)
            .padding()
            .background(Color.white.opacity(0.12))
            .clipShape(Circle())
        Text("ユーザー情報")
            .fontWeight(.bold)
            .foregroundColor(.white)
                                    
        Text("閲覧と編集")
            .fontWeight(.bold)
            .foregroundColor(.white)
                                                    
    Button(action: {
                    self.usereditshow.toggle()
                }){
        Text("開く")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .sheet(isPresented: $usereditshow){
                        UserEditView()
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
                    .fill(Color("whiteorange"))
                    .frame(width:170,height: 150)
        VStack{
            Image(systemName: "person.3.fill")
                .foregroundColor(.white)
                .padding()
                .background(Color.white.opacity(0.12))
                .clipShape(Circle())
            Text("陸上日記")
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text("今日の練習、試合はどうでしたか？")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width:170,height:60)

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
                .fill(Color("green"))
                .frame(width:170,height: 150)
    VStack{
        Image(systemName: "tray.and.arrow.up.fill")
            .foregroundColor(.white)
            .padding()
            .background(Color.white.opacity(0.12))
            .clipShape(Circle())
        Text("ログアウトしますか？")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width:100,height:60)
    Button(action: {
                            }){
        Text("ログアウトする")
            .fontWeight(.bold)
            .foregroundColor(.white)
                        }
                    }
                }.padding(.top,30)
            }
        }
    }
}



struct ManagerView_Previews: PreviewProvider {
    static var previews: some View {
        ManagerView()
    }
}
