//
//  RelayQuestionView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/02.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct RelayQuestionView: View {
    
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
        Text("リレーページ")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .font(.title)
        Text("使い方ガイド")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .font(.title)
                    }.frame(width:400,height: 100)
                        .background(Color("yello4"))

                
    VStack{
        HStack{
            Image(systemName: "lightbulb.fill")
                .foregroundColor(Color("yello4"))
            Text("リレーに申し込みたい!")
                        
                        Spacer()
        Button(action: {
                        self.ApplicationSelected.toggle()
                            })  {
            Image(systemName: "play.fill")
                .foregroundColor(Color("yello4"))
                                    }
                                }.frame(width:300,height: 15)
                                .padding(.top,20)
                        
                        
            HStack{
                Image(systemName: "lightbulb.fill")
                        .foregroundColor(Color("yello4"))
                Text("申し込み中のリレーを見たい")
                                        Spacer()
                Button(action: {
                                self.ApplicationShowSelected.toggle()
                                    })  {
                Image(systemName: "play.fill")
                    .foregroundColor(Color("yello4"))
                                }
                        }.frame(width:300,height: 20)
                        .padding(.top,20)

             
                        
            HStack{
                Image(systemName: "lightbulb.fill")
                        .foregroundColor(Color("yello4"))
                Text("エントリーが完了するには？")
                        Spacer()
            Button(action: {
                            self.GameFinishSelected.toggle()
                            })  {
                Image(systemName: "play.fill")
                            .foregroundColor(Color("yello4"))
                                            }
                                            }.frame(width:300,height: 15)
                                                .padding(.top,25)
                        
            HStack{
                Image(systemName: "lightbulb.fill")
                        .foregroundColor(Color("yello4"))
                Text("リレーオーダー表は誰が提出するの？")
                        Spacer()
            Button(action: {
                            self.GameFinishSelected.toggle()
                        })  {
                Image(systemName: "play.fill")
                        .foregroundColor(Color("yello4"))
                                            }
                                            }.frame(width:300,height: 50)
                        
                        
            HStack{
                 Image(systemName: "lightbulb.fill")
                    .foregroundColor(Color("yello4"))
                        Text("リレーオーダー表を提出したい!")
                Spacer()
                Button(action: {
                        self.GameMistakeSelected.toggle()
                    })  {
                Image(systemName: "play.fill")
                    .foregroundColor(Color("yello4"))
                                        }
                                    }.frame(width:300,height: 50)
                                       

                        
                        
            HStack{
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(Color("yello4"))
                Text("リレー申し込み後、内容に不備を見つけた")
                        Spacer()
            Button(action: {
                            self.GameMistakeSelected.toggle()
                        })  {
                Image(systemName: "play.fill")
                            .foregroundColor(Color("yello4"))
                                    }
                                }.frame(width:300,height: 55)
                                               
                        
            HStack{
                Image(systemName: "lightbulb.fill")
                        .foregroundColor(Color("yello4"))
                Text("提出したリレーオーダー表に不備を見つけた")
                    Spacer()
            Button(action: {
                            self.GameEndSelected.toggle()
                        })  {
                Image(systemName: "play.fill")
                        .foregroundColor(Color("yello4"))
                                        }
                                    }.frame(width:300,height: 55)
                        
                        
            HStack{
                 Image(systemName: "lightbulb.fill")
                    .foregroundColor(Color("yello4"))
                        Text("終了した試合を申込みリストから外したい")
                Spacer()
            Button(action: {
                        self.GameDiaryDeleteSelected.toggle()
                    })  {
                Image(systemName: "play.fill")
                    .foregroundColor(Color("yello4"))
                                    }
                                }.frame(width:300,height: 55)
                                }
                            }
                        }
                    }
                }
            }
        }

struct RelayQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        RelayQuestionView()
    }
}
