//
//  Homescreen.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/21.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct Homescreen: View {
    
    @State var isSelected: Bool = false
    @State var first = ""
    
        
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
                            .foregroundColor(Color("whiteorange"))
//            .sheet(isPresented: $isSelected) {
//                      DismissView(isPresented: self.$isSelected)
                  }
            
                }
            }
        }
    }
}

struct Homescreen_Previews: PreviewProvider {
    static var previews: some View {
        Homescreen()
    }
}

//struct DismissView: View {
//    @Binding var isPresented: Bool
//    var body: some View {
//        Button("Dismiss") {
//            self.isPresented.toggle()
//        }
//    }
//}
