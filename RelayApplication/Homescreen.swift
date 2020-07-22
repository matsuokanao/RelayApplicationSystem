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
    @Binding var show : Bool
    
    var body: some View {
        
        VStack{
                Text("分からない事がありますか？")
                    .fontWeight(.bold)
                    .foregroundColor(Color("blackcolor"))
                Button(action: {
                    self.isSelected.toggle()
                })  {
                    Text("使い方ガイドを見る")
                            .fontWeight(.bold)
                            .foregroundColor(Color("whiteorange"))
            
                }
            if(self.isSelected == true){

        Button(action: {
                try! Auth.auth().signOut()
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"),
                                                object: nil)
                
            }){
                Text("ログアウト")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
            }
            .background(Color("blackcolor"))
            .cornerRadius(10)
            .padding(.top, 25)
            }

        }
    }
}

struct Homescreen_Previews: PreviewProvider {
    static var previews: some View {
        Homescreen(show: .constant(false))
    }
}
