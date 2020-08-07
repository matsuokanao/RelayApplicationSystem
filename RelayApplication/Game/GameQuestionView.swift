//
//  GameQuestionView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/07.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct GameQuestionView: View {
    @State var isSelected: Bool = false
        
            
        var body: some View {
        ZStack(alignment: .topLeading) {
            
                if(self.isSelected == true){
                    WelcomeView(isPresented: self.$isSelected)
                } else {
            VStack{
                Text("まずはアプリの使い方を知ろう！")
                        .fontWeight(.bold)
                        .foregroundColor(Color("blackcolor"))
                Text("分からないことがありますか？")
                        .fontWeight(.bold)
                        .foregroundColor(Color("blackcolor"))
                Button(action: {
                        self.isSelected.toggle()
                    })  {
                Text("使い方ガイド")
                        .fontWeight(.bold)
                    .foregroundColor(Color.red)
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
