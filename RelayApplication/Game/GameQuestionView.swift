//
//  GameQuestionView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/07.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct GameQuestionView: View {
    
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
                            Text("試合ページ")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(.title)
                            Text("使い方ガイド")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(.title)
                        }.frame(width:400,height: 100)
                            .background(Color("blue4"))
                        
                        
                        VStack{
                            
                            HStack{
                                Image(systemName: "lightbulb.fill")
                                    .foregroundColor(Color("blue4"))
                                Text("試合に申し込みたい!")
                                
                                Spacer()
                                Button(action: {
                                    self.ApplicationSelected.toggle()
                                })  {
                                    Image(systemName: "play.fill")
                                        .foregroundColor(Color("blue4"))
                                    
                                }
                            }.frame(width:300,height: 15)
                                .padding(.top,20)
                            
                            
                            HStack{
                                Image(systemName: "lightbulb.fill")
                                    .foregroundColor(Color("blue4"))
                                Text("申し込み中の試合を見たい")
                                Spacer()
                                Button(action: {
                                    self.ApplicationShowSelected.toggle()
                                })  {
                                    Image(systemName: "play.fill")
                                        .foregroundColor(Color("blue4"))
                                }
                            }.frame(width:300,height: 15)
                                .padding(.top,20)
                            
                            
                            
                            HStack{
                                Image(systemName: "lightbulb.fill")
                                    .foregroundColor(Color("blue4"))
                                Text("エントリーが完了するには？")
                                Spacer()
                                Button(action: {
                                    self.GameFinishSelected.toggle()
                                })  {
                                    Image(systemName: "play.fill")
                                        .foregroundColor(Color("blue4"))
                                }
                            }.frame(width:300,height: 15)
                                .padding(.top,20)
                            
                            
                            HStack{
                                Image(systemName: "lightbulb.fill")
                                    .foregroundColor(Color("blue4"))
                                Text("試合申し込み後、内容に不備を見つけた")
                                Spacer()
                                Button(action: {
                                    self.GameMistakeSelected.toggle()
                                })  {
                                    Image(systemName: "play.fill")
                                        .foregroundColor(Color("blue4"))
                                }
                            }.frame(width:300,height: 55)
                            
                            
                            HStack{
                                Image(systemName: "lightbulb.fill")
                                    .foregroundColor(Color("blue4"))
                                Text("終了した試合を申込みリストから外したい")
                                Spacer()
                                Button(action: {
                                    self.GameEndSelected.toggle()
                                })  {
                                    Image(systemName: "play.fill")
                                        .foregroundColor(Color("blue4"))
                                }
                            }.frame(width:300,height: 55)
                            
                            
                            HStack{
                                Image(systemName: "lightbulb.fill")
                                    .foregroundColor(Color("blue4"))
                                Text("試合日記を削除したい")
                                Spacer()
                                Button(action: {
                                    self.GameDiaryDeleteSelected.toggle()
                                })  {
                                    Image(systemName: "play.fill")
                                        .foregroundColor(Color("blue4"))
                                }
                            }.frame(width:300,height: 15)
                                .padding(.top,10)
                            
                        }
                    }
                }
            }
        }
    }
}


struct GameQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        GameQuestionView()
    }
}
