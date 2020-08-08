//
//  ManagerQuestion.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/28.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct ManagerQuestion: View {
    @State var ApplicationSelected: Bool = false
    @State var ApplicationShowSelected: Bool = false
    @State var GameFinishSelected: Bool = false
    @State var GameMistakeSelected: Bool = false
    @State var GameEndSelected: Bool = false
    @State var GameDiaryDeleteSelected: Bool = false

    var body: some View {
            VStack{
                    ScrollView{
                    VStack{

                    if(self.ApplicationSelected == true){
                        GameAnswerApplication(ApplicationSelected: self.$ApplicationSelected)
                        
                    } else if(self.ApplicationShowSelected == true){
                        GameAnswerApplicationShow(ApplicationShowSelected: self.$ApplicationShowSelected)
                        
                    } else if(self.GameFinishSelected == true){
                        GameAnswerApplicationFinish(GameFinishSelected: self.$GameFinishSelected)
                        
                    } else if(self.GameMistakeSelected == true){
                        GamaAnswerApplicationMistake(GameMistakeSelected: self.$GameMistakeSelected)
                        
                    } else if(self.GameEndSelected == true){
                        GameAnswerEnd(GameEndSelected: self.$GameEndSelected)
                        
                    } else if(self.GameDiaryDeleteSelected == true){
                        GameAnswerDiaryDelete(GameDiaryDeleteSelected: self.$GameDiaryDeleteSelected)

                    }else {
        VStack{
            Text("大会関係者専用ページ")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .font(.title)
            Text("使い方ガイド")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .font(.title)
                        }.frame(width:400,height: 100)
                            .background(Color("green6"))

                    
        VStack{
            HStack{
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(Color("green6"))
                Text("運営団体情報とは？")
                            
                            Spacer()
            Button(action: {
                            self.ApplicationSelected.toggle()
                                })  {
                Image(systemName: "play.fill")
                    .foregroundColor(Color("green6"))
                                        }
                                    }.frame(width:300,height: 15)
                                    .padding(.top,20)
                            
                            
                HStack{
                    Image(systemName: "lightbulb.fill")
                            .foregroundColor(Color("green6"))
                    Text("試合を作成したい！")
                                            Spacer()
                    Button(action: {
                                    self.ApplicationShowSelected.toggle()
                                        })  {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color("green6"))
                                    }
                            }.frame(width:300,height: 20)
                            .padding(.top,20)

                 
                            
                HStack{
                    Image(systemName: "lightbulb.fill")
                            .foregroundColor(Color("green6"))
                    Text("試合を作成をした後の、大会までの流れを知りたい")
                            Spacer()
                Button(action: {
                                self.GameFinishSelected.toggle()
                                })  {
                    Image(systemName: "play.fill")
                                .foregroundColor(Color("green6"))
                                                }
                                                }.frame(width:300,height: 50)
                HStack{
                    Image(systemName: "lightbulb.fill")
                            .foregroundColor(Color("green6"))
                    Text("大会終了後の流れを知りたい")
                            Spacer()
                Button(action: {
                                self.GameFinishSelected.toggle()
                            })  {
                    Image(systemName: "play.fill")
                            .foregroundColor(Color("green6"))
                                                }
                                                }.frame(width:300,height: 50)
                            
                            
                HStack{
                     Image(systemName: "lightbulb.fill")
                        .foregroundColor(Color("green6"))
                            Text("登録した試合情報の内容を変更したい")
                    Spacer()
                    Button(action: {
                            self.GameMistakeSelected.toggle()
                        })  {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color("green6"))
                                            }
                                        }.frame(width:300,height: 50)
                                           

                            
                            
                HStack{
                    Image(systemName: "lightbulb.fill")
                        .foregroundColor(Color("green6"))
                    Text("登録した試合を削除したい")
                            Spacer()
                Button(action: {
                                self.GameMistakeSelected.toggle()
                            })  {
                    Image(systemName: "play.fill")
                                .foregroundColor(Color("green6"))
                                        }
                                    }.frame(width:300,height: 55)
                                                   
                            
                HStack{
                    Image(systemName: "lightbulb.fill")
                            .foregroundColor(Color("green6"))
                    Text("リレーのオーダーリストについて知りたい")
                        Spacer()
                Button(action: {
                                self.GameEndSelected.toggle()
                            })  {
                    Image(systemName: "play.fill")
                            .foregroundColor(Color("green6"))
                                            }
                                        }.frame(width:300,height: 55)
                            
                            
                HStack{
                     Image(systemName: "lightbulb.fill")
                        .foregroundColor(Color("green6"))
                            Text("試合のエントリーリストについて知りたい")
                    Spacer()
                Button(action: {
                            self.GameDiaryDeleteSelected.toggle()
                        })  {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color("green6"))
                                        }
                                    }.frame(width:300,height: 55)
                                    }
                                }
                            }
                        }
                    }
                }
            }

struct ManagerQuestion_Previews: PreviewProvider {
    static var previews: some View {
        ManagerQuestion()
    }
}
